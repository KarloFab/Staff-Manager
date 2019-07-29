using Microsoft.ApplicationBlocks.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data;

namespace PeopleWebApplication.Models
{
	public class SqlManager : IRepo
	{
		private readonly string cs;

		public SqlManager()
		{
			cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
		}

		public int DeletePerson(int id)
		{
			return SqlHelper.ExecuteNonQuery(cs, "deletePerson", id);
		}

		public List<Person> GetPeople()
		{
			List<Person> people = new List<Person>();
			DataSet dataSet = SqlHelper.ExecuteDataset(cs, "getPeople");

			foreach (DataRow row in dataSet.Tables[0].Rows)
			{
				Person person = new Person();
				person.IDPerson = (int)row["IDPerson"];
				person.Name = row["PersonName"].ToString();
				person.Surname = row["Surname"].ToString();
				person.ContactTelephone = row["ContactTelephone"].ToString();
				person.Password = row["PersonPassword"].ToString();
				person.Status = row["PersonStatus"].ToString();
				person.City = row["Grad"].ToString();
				people.Add(person);
			}

			foreach (Person person in people)
			{
				GetEmails(person);
			}
			return people;
		}

		private void GetEmails(Person person)
		{

			DataSet dataSet = SqlHelper.ExecuteDataset(cs, "getEmails", person.IDPerson);

			foreach (DataRow row in dataSet.Tables[0].Rows)
			{
				Email email = new Email
				{
					IDEmail = (int)row["IDPersonEmail"],
					Name = row["Email"].ToString()
				};
				person.Emails.Add(email);
			}
		}

		public int InsertPerson(Person person)
		{
			int result = SqlHelper.ExecuteNonQuery(cs, "insertPerson",
				person.Name,
				person.Surname,
				person.ContactTelephone,
				person.Password,
				person.Status,
				person.City);

			List<Person> people = GetPeople();
			int id = people[people.Count - 1].IDPerson;

			InsertEmails(person.Emails, id);
			return result;
		}

		private void InsertEmails(List<Email> emails, int idperson)
		{
			foreach (Email email in emails)
			{
				SqlHelper.ExecuteNonQuery(cs, "insertEmails", idperson, email.Name);
			}
		}

		public int UpdatePerson(Person person, int id)
		{
			int result = SqlHelper.ExecuteNonQuery(cs, "updatePerson",
				id,
				person.Name,
				person.Surname,
				person.ContactTelephone,
				person.Password,
				person.Status,
				person.City);

			UpdateEmails(person.Emails, id);

			return result;
		}

		private void UpdateEmails(List<Email> emails, int id)
		{
			foreach (Email email in emails)
			{
				SqlHelper.ExecuteNonQuery(cs, "updateEmails",
				email.IDEmail,
				email.Name
				);

			}
		}
	}
}