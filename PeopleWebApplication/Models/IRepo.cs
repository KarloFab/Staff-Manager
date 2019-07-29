using System.Collections.Generic;

namespace PeopleWebApplication.Models
{
	public interface IRepo
	{
		int InsertPerson(Person person);
		int DeletePerson(int id);
		int UpdatePerson(Person person, int id);
		List<Person> GetPeople();
	}
}
