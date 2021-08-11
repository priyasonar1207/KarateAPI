package tests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;
 
public class TestRunner {

	@Test
    public void testParallel() {
        Results results = Runner.parallel(getClass(),6);
    }
}
 