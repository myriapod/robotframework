import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

#driver = webdriver.Firefox()

"""driver.get("https://www.python.org")

driver.execute_script("window.open('https://www.google.com', '_blank');")

driver.switch_to.window(driver.window_handles[1])

driver.switch_to.window(driver.window_handles[0])
"""
"""print(driver.title)

search_bar = driver.find_element(By.NAME, "q")
search_bar.clear()
search_bar.send_keys("getting started with python")
search_bar.send_keys(Keys.ENTER)

print(driver.current_url)"""

"""
driver.get("https://www.python.org")

downloads_link = driver.find_element(By.XPATH, "//a[text()='Downloads']")

downloads_link.click()
print(driver.current_url)

header = driver.find_element(By.CLASS_NAME, "call-to-action")
print(header.text)
"""
#driver.close()


class PythonOrgSearchTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = webdriver.Firefox()
        cls.driver.get("https://www.python.org")

    def test_search_python(self):
        search_bar = self.driver.find_element(By.NAME, "q")
        search_bar.send_keys("Python")
        search_bar.send_keys(Keys.ENTER)
        self.assertIn("somethingelse", self.driver.title)

    @classmethod
    def tearDownClass(cls):
        cls.driver.close()


if __name__ == "__main__":
    unittest.main()