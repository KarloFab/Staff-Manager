namespace PeopleWebApplication.Models
{
	public class Email
	{
		public int IDEmail { get; set; }
		public string Name { get; set; }

		public override string ToString()
		{
			return $"{IDEmail}-{Name}";
		}

	}
}