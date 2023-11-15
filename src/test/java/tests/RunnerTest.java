package tests;

import com.intuit.karate.junit5.Karate;

public class RunnerTest {
    
    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@tests_sso_api_login").relativeTo(getClass());
    }

}
