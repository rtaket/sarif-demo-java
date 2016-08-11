public class Hello {

	public static void main(String[] args) {
		System.out.print("Hello World!");
	}
	
    public static void incorrectAssignmentInIfCondition() {
        boolean value = false;
        if (value = true) {
            //do Something
        } else {
            //else Do Something
        }
    }
}