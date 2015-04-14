public class Main
{
	public static void main(String[] args)
	{
		String str;
		int count=0,j;
		char [] ch;
		for(int i=0;i<=999999;i++)
		{
			str=String.valueOf(i);
			ch=str.toCharArray();
			//System.out.println(str);
			for(j=0;j<ch.length;j++)
			{
				if(ch[j]=='3')
					break;
				else continue;
			}
			if(j!=ch.length)
				count++;
		}
		System.out.println(count);		
			
	}
}