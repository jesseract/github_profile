class ProfileController < ApplicationController
  # def avatar_url
  #   @avatar "https://avatars.githubusercontent.com/u/10173258?v=3"
  #   @avatar
  # end

  def index
    profile_url = "https://api.github.com/users/jesseract/repos"
    @profile = HTTParty.get(profile_url, login_info)

    avatar_url = "https://api.github.com/users/jesseract"
    @avatar = HTTParty.get(avatar_url, login_info)["avatar_url"]
  end

  private def login_info
    {headers: {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
               "User-Agent" => "jesseract"}
    }
  end

end
