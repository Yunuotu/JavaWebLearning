import java.util.Arrays;
public class MyList implements IList{
    private Object[] list;
	private int space;
	private int ptr=-1;
	
    public MyList() {
		System.out.println("初始容量为:"+space+"  初始末尾指针为:"+ptr);
    }
	
    public void add(Object elem)
    {
		if(space==0) //当list初始数组的容量为0时
		{
			space=1;
			list=new Object[space];  //创建容量为1的list数组
		}
		else if(space!=0&&ptr==space-1) //list数组已经装满
		{
			space*=2;
			list=Arrays.copyOf(list,space);  //将list数组的容量翻倍
		}
		System.out.println("当前数组容量为："+space); //输出当前数组容量
		System.out.println("待插入坐标为"+(ptr+1));  //输出待插入的位置
		list[++ptr]=elem;  //末尾指针后移，并插入元素
    }
	
    public Object get(int index) {
        if(index<0&&index>ptr)
			throw new java.lang.IndexOutOfBoundsException(); //下标不合法，抛出异常
		else
			return list[index];  //返回合法的下标范围内的数组元素
    }
	
    public int size() {
        return ptr+1;  //末尾指针加1就是size
    }
	
    public void clear() {
        list=null;
		ptr=-1;
		space=0;     //重置成员变量
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