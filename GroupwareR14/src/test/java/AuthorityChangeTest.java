// Generated by Selenium IDE
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
public class AuthorityChangeTest {
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
  public void authorityChange() {
    driver.get("http://localhost:8080/groupware/home");
    driver.manage().window().setSize(new Dimension(1920, 1040));
    driver.findElement(By.linkText("로그인")).click();
    driver.findElement(By.id("userLoginID")).sendKeys("00000000");
    driver.findElement(By.id("userLoginPW")).sendKeys("12341234");
    driver.findElement(By.id("userLoginPW")).sendKeys(Keys.ENTER);
    driver.findElement(By.cssSelector(".fa-info-circle")).click();
    driver.findElement(By.cssSelector(".fa-user-cog")).click();
    driver.findElement(By.cssSelector("tr:nth-child(10) .check")).click();
    driver.findElement(By.id("selectRole")).click();
    {
      WebElement dropdown = driver.findElement(By.id("selectRole"));
      dropdown.findElement(By.xpath("//option[. = '관리자']")).click();
    }
    driver.findElement(By.cssSelector(".changeButton")).click();
    assertThat(driver.switchTo().alert().getText(), is("해당 사용자의 권한을 변경하시겠습니까?"));
    driver.switchTo().alert().accept();
    assertThat(driver.switchTo().alert().getText(), is("변경 성공"));
  }
}
