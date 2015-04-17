#include <iostream>
#include <string>
#include <map>
using namespace std;

bool isLeapYear(int year)
{
	if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
		return true;
	return false;
}
int count(int begin, int end)
{
	int s = 0;
	int i = begin;
	while (i <= end)
	{
		if (isLeapYear(i))
			s += 1;
		i += 4;
	}
	return s;
	
}
int main()
{
	map<string, int> str2int{ { "January", 1 }, { "February", 2 }, { "March", 3 }, { "April", 4 },
	{ "May", 5 }, { "June", 6 }, { "July", 7 }, { "August", 8 },
	{ "September", 9 }, { "October", 10 }, { "November", 11 }, { "December", 12 } };
	string str;
	int T; cin >> T;
	int i;
	int y1, m1, d1;
	int y2, m2, d2;
	char c;
	int left, right;
	for (i = 1; i <= T; i++)
	{
		cin >> str >> d1 >> c >> y1;
		m1 = str2int[str];
		cin >> str >> d2 >> c >> y2;
		m2 = str2int[str];
		//cout << y1 << m1 << d1 << y2 << m2 << d2 << endl;
		if (isLeapYear(y1))
		{
			if (m1 <= 2)
				left = y1;
			else
			{
				y1 += 4;
				while (!isLeapYear(y1))
					y1 += 4;
				left = y1;

			}
		}
		else 
		{
			y1 += 4 - y1 % 4;
			while (!isLeapYear(y1))
				y1 += 4;
			left = y1;

		}
		//cout << left << endl;

		if (isLeapYear(y2))
		{
			if (m2 > 2 || (m2 == 2 && d2 == 29))
				right = y2;
			else
			{
				y2 -= 4;
				while (!isLeapYear(y2))
					y2 -= 4;
				right = y2;
			}
		}
		else
		{
			y2 -= y2 % 4;
			while (!isLeapYear(y2))				
				y2 -= 4;
			right = y2;

		}
		//cout << right << endl;

		
		cout << "Case #" << i << ": " << count(left, right) << endl;

	}
	return 0;
}