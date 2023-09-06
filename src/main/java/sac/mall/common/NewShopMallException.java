package sac.mall.common;

public class NewShopMallException extends RuntimeException {

    public NewShopMallException() {
    }

    public NewShopMallException(String message) {
        super(message);
    }

    /**
     * 丢出一个异常
     *
     * @param message
     */
    public static void fail(String message) {
        throw new NewShopMallException(message);
    }

}
