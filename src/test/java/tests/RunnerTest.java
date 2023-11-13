package tests;

import com.intuit.karate.junit5.Karate;

public class RunnerTest {
    
    @Karate.Test
    Karate testFeature() {
        return Karate.run("pruebaGET").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@tests_sso_ui_login").relativeTo(getClass());
    }

}
