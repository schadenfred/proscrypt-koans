describe "Koan" do

  proscrypt_gems = [

    [
      "'haml-rails'",
      "HTML is ugly, especially with ruby embedded inside. One way to make it prettier is to use .haml.",
      "http://haml.info/",
      "'~> 1.0'"
    ],
    [
      "'bootstrap'", "There are lots of good .css and .js frameworks to choose from in building web apps. Bootstrap is a good one.",
      "https://getbootstrap.com/",
      "'~> 4.1.1'"
    ],
    [
      "'jquery-rails'",
      "We need jquery for bootstrap.",
      "https://jquery.com/"
    ],
    [
      "'devise'",
      "Devise will handle user authentication for us.",
      "https://github.com/plataformatec/devise"
    ]
  ]

  proscrypt_gems.each do |gem, msg, reflect, version|

    it "must have installed #{gem}" do
      msg << " Install it."
      file = "Gemfile"
      code = version.present? ? "gem #{gem + ", " + version}" : "gem #{gem}"
      assert File.read(file).match(code), koan(
        msg,
        file: file,
        code: code,
        placement: "just below line 39",
        command: "bundle install",
        reflect: reflect)
    end
  end
end
