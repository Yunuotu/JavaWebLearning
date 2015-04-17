#include <iostream>
#include <bitset>
using namespace std;

int main()
{
	int l, r;
	int len;
	int count;
	int t;
	string str;
	bitset<25> num;
	int T; cin >> T;
	for (int i = 1; i <= T; i++)
	{
		cin >> str;
		
		count = 0;
		len = str.size();
		t = (1 << len) - 1; 
		for (int j = 1; j <= t; j++)
		{
			num = j;
			l = 0; r = len-1;
			while (true)
			{
				if (l >= r)
				{
					count++; 
					break;
				}
				while (l < len && (!num.test(l)))
					l++;
				while (r > -1 && (!num.test(r)))
					r--;
				if (str[l] != str[r])
					break;
				
				l++;
				r--;
			}
		}
		cout << "Case #" << i << ": " << count % 100007 << endl;
	}

}