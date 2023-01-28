import unittest
from app import launch

class TestLaunchApp(unittest.TestCase):

  def test_launch(self):
    self.assertEqual(launch(), "Done.")

if __name__ == '__main__':
  unittest.main()
