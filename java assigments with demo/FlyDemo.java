
public class FlyDemo {
	private static final String[] flyingPeople = { "ika", "koka" };

	public static void main(String[] args) {
		try {
			FlyDemo.fly("ika");
		} catch (FlyException e) {
			e.printStackTrace();
		}
		try {
			FlyDemo.fly("koka");
		} catch (FlyException e) {
			e.printStackTrace();
		}
		try {
			FlyDemo.fly("vinme sxva");
		} catch (FlyException e) {
			e.printStackTrace();
		}

	}

	public static void fly(String name) throws FlyException {
		for (int i = 0; i < flyingPeople.length; i++) {
			if (name.equals(flyingPeople[i])) {
				System.out.println(name + " deserves to fly");
				return;
			}
		}
		throw new FlyException();
	}
}
