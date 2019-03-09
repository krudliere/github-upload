public class UserTriggerHandler {

	public void forceForecasting(List<User> ut) {
        for (User u : ut) {
            u.ForecastEnabled = true;
        }
    }
}