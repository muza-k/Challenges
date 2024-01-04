
import java.lang.reflect.*;
import java.util.*;

interface TestInterface {
    int calculate(int a, int b);
    String calculate(String a, String b);
    String getValue();
}

public class MockLibrary implements InvocationHandler {
    ArrayList<MethodInvocation> methodInvocations = new ArrayList<>();

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        String methodName = method.getName();
        for (MethodInvocation invocation : methodInvocations) {
            if (invocation.getMethodName().equals(methodName) &&
                    Arrays.deepEquals(invocation.getArguments(), args)) {
                return invocation.getReturnValue();
            }
        }

        throw new IllegalArgumentException("No matching invocation found for method: " + methodName);
    }

    public MockLibrary when(String method, Object[] args) {
        methodInvocations.add(new MethodInvocation(method, args, null));
        return this;
    }

    public void thenReturn(Object val) {
        int lastIndex = methodInvocations.size() - 1;
        methodInvocations.get(lastIndex).setReturnValue(val);
    }

    public static void main(String[] args) {
        MockLibrary handler = new MockLibrary();
        TestInterface ref = (TestInterface) Proxy.newProxyInstance(
                MockLibrary.class.getClassLoader(),
                new Class[]{TestInterface.class}, handler);

        handler.when("calculate", new Object[] {1, 2}).thenReturn(3);
        handler.when("awesome", new Object[] {"a", "b"}).thenReturn("ab");

        System.out.println(ref.calculate(1, 2)); // prints 3
        System.out.println(ref.calculate("a", "b")); // prints "ab"
    }
}

class MethodInvocation {
    private String methodName;
    private Object[] arguments;
    private Object returnValue;

    public MethodInvocation(String methodName, Object[] arguments, Object returnValue) {
        this.methodName = methodName;
        this.arguments = arguments;
        this.returnValue = returnValue;
    }

    public String getMethodName() {
        return methodName;
    }

    public Object[] getArguments() {
        return arguments;
    }

    public Object getReturnValue() {
        return returnValue;
    }

    public void setReturnValue(Object returnValue) {
        this.returnValue = returnValue;
    }
}

