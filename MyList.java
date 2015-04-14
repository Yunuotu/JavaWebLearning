import java.util.Arrays;
public class MyList implements IList{
    private Object[] list;
	private int space;
	private int ptr=-1;
	
    public MyList() {
		System.out.println("��ʼ����Ϊ:"+space+"  ��ʼĩβָ��Ϊ:"+ptr);
    }
	
    public void add(Object elem)
    {
		if(space==0) //��list��ʼ���������Ϊ0ʱ
		{
			space=1;
			list=new Object[space];  //��������Ϊ1��list����
		}
		else if(space!=0&&ptr==space-1) //list�����Ѿ�װ��
		{
			space*=2;
			list=Arrays.copyOf(list,space);  //��list�������������
		}
		System.out.println("��ǰ��������Ϊ��"+space); //�����ǰ��������
		System.out.println("����������Ϊ"+(ptr+1));  //����������λ��
		list[++ptr]=elem;  //ĩβָ����ƣ�������Ԫ��
    }
	
    public Object get(int index) {
        if(index<0&&index>ptr)
			throw new java.lang.IndexOutOfBoundsException(); //�±겻�Ϸ����׳��쳣
		else
			return list[index];  //���غϷ����±귶Χ�ڵ�����Ԫ��
    }
	
    public int size() {
        return ptr+1;  //ĩβָ���1����size
    }
	
    public void clear() {
        list=null;
		ptr=-1;
		space=0;     //���ó�Ա����
    }
	
	public static void main(String[] args) {
		MyList lst=new MyList();
		Integer[] a={1,2,3,4,5};
		for(Integer e:a)
			lst.add(e);
		System.out.println(lst.size());
		for(int i=0;i<lst.size();i++)
			System.out.println(lst.get(i));
		//System.out.println(lst.get(8));
		lst.clear();
		System.out.println(lst.size());
		lst.add(1000);
		System.out.println(lst.get(0));
		
	}
}