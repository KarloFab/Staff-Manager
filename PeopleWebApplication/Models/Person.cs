using System;
using System.Collections.Generic;
using System.Linq;

namespace PeopleWebApplication.Models
{
	public class Person : IComparable<Person>
	{
		private const char DELIMITER = '|';

		public List<Email> Emails;

		public List<Email> EmailsList
		{
			get
			{
				return Emails;
			}

		}

		public int IDPerson { get; set; }

		public string Name { get; set; }

		public string Surname { get; set; }

		public string ContactTelephone { get; set; }

		public string City { get; set; }

		public string Password { get; set; }
		public string Status { get; set; }

		public Person()
		{
			Emails = new List<Email>();
		}

		public override string ToString()
		{
			return $"{Name}{DELIMITER}{Surname}{DELIMITER}{ContactTelephone}{DELIMITER}{string.Join(",", Emails.Select(e => e.ToString()).ToArray())}{DELIMITER}{City}{DELIMITER}{Password}{DELIMITER}{Status}";
		}
		public string PrepareForFile()
		{

			string emailsString = string.Join(",", Emails.Select(e => e.ToString()).ToArray());
			return $"{IDPerson}{DELIMITER}{Name}{DELIMITER}{Surname}{DELIMITER}{ContactTelephone}{DELIMITER}{emailsString}{DELIMITER}{City}{DELIMITER}{Password}{DELIMITER}{Status}";
		}
		public static Person GetPeopleFromFile(string line)
		{
			string[] data = line.Split('|');
			Person person = new Person
			{
				IDPerson = int.Parse(data[0]),
				Name = data[1],
				Surname = data[2],
				ContactTelephone = data[3],
				City = data[5],
				Password = data[6],
				Status = data[7],

			};

			string[] emailsdata = data[4].Split(',');
			foreach (var mail in emailsdata)
			{
				string[] split = mail.Split('-');

				Email email = new Email
				{
					IDEmail = int.Parse(split[0]),
					Name = split[1]

				};
				person.Emails.Add(email);
			}


			return person;

		}

		public int CompareTo(Person other)
		{
			return this.IDPerson.CompareTo(other.IDPerson);
		}
	}
}