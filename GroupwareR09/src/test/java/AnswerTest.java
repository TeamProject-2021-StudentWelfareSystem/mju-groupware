// Generated by Selenium IDE
import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.core.IsNot.not;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Alert;
import org.openqa.selenium.Keys;
import java.util.*;
import java.net.MalformedURLException;
import java.net.URL;
public class AnswerTest {
  private WebDriver driver;
  private Map<String, Object> vars;
  JavascriptExecutor js;
  @Before
  public void setUp() {
	  System.setProperty("webdriver.chrome.driver", "C:\\Selenium\\chromedriver.exe");
    driver = new ChromeDriver();
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }
  @After
  public void tearDown() {
    //driver.quit();
  }
  @Test
  public void answerTest() {
    driver.get("http://localhost:8080/groupware/home");
    driver.manage().window().setSize(new Dimension(1920, 1040));
    driver.findElement(By.linkText("로그인")).click();
    driver.findElement(By.id("userLoginID")).sendKeys("00000000");
    driver.findElement(By.id("userLoginPW")).sendKeys("12341234");
    driver.findElement(By.id("userLoginPW")).sendKeys(Keys.ENTER);
    driver.findElement(By.linkText("문의")).click();
    driver.findElement(By.linkText("문의")).click();
    driver.findElement(By.linkText("문의")).click();
    driver.findElement(By.linkText("문의하기")).click();
    driver.findElement(By.linkText("예약 확인 테스트")).click();
    driver.findElement(By.id("inquiryAnswer")).click();
    driver.findElement(By.id("inquiryAnswer")).sendKeys("알겠어요");
    driver.findElement(By.id("saveButton")).click();
    driver.findElement(By.linkText("예약;")).click();
    driver.findElement(By.id("listButton")).click();
  }
}
