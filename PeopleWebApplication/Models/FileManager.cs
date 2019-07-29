using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace PeopleWebApplication.Models
{
	public class FileManager : IRepo
	{
		private readonly string PATH = @"C:\Users\Karlo\Desktop\PROJECTZ\RWA_WebForms_Project\TextBaza.txt";
		public FileManager()
		{
			if (!File.Exists(PATH))
			{
				File.Create(PATH).Close();
			}
		}
		public int DeletePerson(int id)
		{
			List<Person> people = GetPeople();

			foreach (Person person in people)
			{
				if (person.IDPerson == id)
				{
					people.Remove(person);
					break;
				}
			}

			File.WriteAllLines(PATH, people.Select(p => p.PrepareForFile()));
			return 1;
		}

		public List<Person> GetPeople()
		{
			List<Person> people = new List<Person>();
			string[] lines = File.ReadAllLines(PATH);
			lines.ToList().ForEach(line => people.Add(Person.GetPeopleFromFile(line)));
			people.Sort();
			return people;
		}

		public int InsertPerson(Person person)
		{
			try
			{
				List<Person> people = GetPeople();

				if (people.Count != 0)
				{
					int idperson = people[people.Count - 1].IDPerson;
					person.IDPerson = ++idperson;
					InsertPeople(people, person);
					return 1;
				}
				else
				{
					person.IDPerson = 0;
					InsertPeople(people, person);
					return 1;
				}

			}
			catch (Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
			return -1;
		}

		private void InsertPeople(List<Person> people, Person person)
		{
			people.Add(person);
			people.Sort();
			File.WriteAllLines(PATH, people.Select(p => p.PrepareForFile()));
		}

		public int UpdatePerson(Person person, int id)
		{
			List<Person> people = GetPeople();

			foreach (Person p in people)
			{
				if (p.IDPerson == id)
				{
					p.Name = person.Name;
					p.Surname = person.Surname;
					p.ContactTelephone = person.ContactTelephone;
					p.Password = person.Password;
					p.Status = person.Status;
					p.City = person.City;

					for (int i = 0; i < p.Emails.Count; i++)
					{
						p.Emails[i] = person.Emails[i];
					}
				}

			}

			File.WriteAllLines(PATH, people.Select(p => p.PrepareForFile()));
			return 1;
		}
	}
}