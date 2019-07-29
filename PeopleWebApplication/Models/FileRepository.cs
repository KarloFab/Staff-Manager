namespace PeopleWebApplication.Models
{
	public static class FileRepository
	{
		public static IRepo GetRepo(int repo)
		{
			switch (repo)
			{
				case 0:
					return new SqlManager();
				case 1:
					return new FileManager();
				default:
					break;
			}

			return new SqlManager();
		}

	}
}