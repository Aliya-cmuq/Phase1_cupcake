class PagesController < ApplicationController
  def Home
    @title = "Home"
  end

  def AboutUs
    @title = "About Us"
  end

  def PrivacyPolicy
    @title = "Privacy Policy"
  end

  def ContactUs
    @title = "Contact Us"
  end
end
