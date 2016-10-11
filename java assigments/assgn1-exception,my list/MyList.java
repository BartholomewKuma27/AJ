import java.awt.List;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.ListIterator;
public class MyList<T> implements java.util.List<T> {
	private final int initSize = 5;
	private int curIndex;
	Object[] arr;

	public MyList() {
		arr = new Object[initSize];
		curIndex = 0;
	}

	public static void main(String[] args) {
		//check class
		
		MyList<Integer> l = new MyList<>();
		l.add(15);
		l.add(150);
		l.add(17);
		l.add(1);
		l.add(3);
		l.add(5);
		l.add(6);
		System.out.println(l.toString());
		l.add(0, 0);
		l.add(1, 1);
		System.out.println(l.toString());
		l.clear();
		System.out.println("arraysgan darcha " + l.toString());
		System.out.println(l.isEmpty());
		l.add(1);
		l.add(2);
		l.add(3);
		l.add(4);
		l.set(0, 10);
		l.set(1, 20);
		System.out.println(l.toString());
		System.out.println(l.get(0));
		System.out.println(l.get(1));
		l.add(2,100);
		System.out.println(l.toString());
		l.add(5,300);
		System.out.println(l.toString());
		System.out.println(l.indexOf(10));
		System.out.println(l.indexOf(300));
		l.remove((Object)100);
		l.remove((Object)300);
		l.remove(0);
		System.out.println(l.size());
		System.out.println(l.toString());
		System.out.println(l.contains(3));
		System.out.println(l.contains(4));
		System.out.println(l.contains(5));
		
	}

	@Override
	public boolean add(T e) {
		if (arr.length == curIndex) {
			doubleArraySize();
		}
		arr[curIndex++] = e;
		return true;
	}

	private void doubleArraySize() {
		Object[] newArr = new Object[arr.length * 2];
		for (int i = 0; i < arr.length; i++) {
			newArr[i] = arr[i];
		}
		arr = newArr;
	}
	
	@Override
	public void add(int index, T element) {
		if (arr.length == curIndex) {
			doubleArraySize();
		}
		for (int i = curIndex; i > index; i--) {
			arr[i] = arr[i-1];
		}
		arr[index] = element;
		curIndex++;
	}

	@Override
	public void clear() {
		curIndex = 0;
	}

	@Override
	public boolean contains(Object o) {
		return indexOf(o) >= 0;
	}

	@Override
	public T get(int index) {
		return (T) arr[index];
	}

	@Override
	public int indexOf(Object o) {
		for (int i = 0; i < curIndex; i++) {
			if (o.equals(arr[i])) {
				return i;
			}
		}
		return -1;
	}

	@Override
	public boolean isEmpty() {
		return curIndex == 0;
	}

	@Override
	public boolean remove(Object o) {
		int objIndex = indexOf(o);
		if (objIndex < 0) {
			return false;
		}
		remove(objIndex);
		return true;
	}

	@Override
	public T remove(int index) {
		Object tmp = arr[index];
		for (int i = index; i < curIndex; i++) {
			arr[i] = arr[i + 1];
		}
		curIndex--;
		return (T) tmp;
	}

	@Override
	public T set(int index, T element) {
		Object tmp = arr[index];
		arr[index] = element;
		return (T) tmp;
	}

	@Override
	public int size() {
		return curIndex;
	}

	@Override
	public String toString() {
		if (curIndex == 0) {
			return "";
		}
		String finalStr = "";
		for (int i = 0; i < curIndex; i++) {
			finalStr += arr[i] + " ";
		}
		return finalStr.substring(0, finalStr.length() - 1);
	}

	@Override
	public boolean addAll(Collection<? extends T> c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addAll(int index, Collection<? extends T> c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean containsAll(Collection<?> c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Iterator<T> iterator() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int lastIndexOf(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ListIterator<T> listIterator() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ListIterator<T> listIterator(int index) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeAll(Collection<?> c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean retainAll(Collection<?> c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public java.util.List<T> subList(int fromIndex, int toIndex) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object[] toArray() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T[] toArray(T[] a) {
		// TODO Auto-generated method stub
		return null;
	}

}
