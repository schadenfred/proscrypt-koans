require_relative '../../koans_runner'

describe "Koan" do

  i_suck_and_my_tests_are_order_dependent!

  before do
    @koans = Koans::Runner.new(self, __FILE__)
  end

  @proscrypt_gems = [
    [
      "'haml-rails', '~> 1.0'",
      "HTML is ugly with all those gross tags, and even uglier when we have to embed ruby inside it, which we're going to have to do a heck of a lot of. We should switch our view templating language to haml.",
      "https://github.com/indirect/haml-rails"
    ],
    [
      "'bootstrap', '~> 4.1.1'", "Nobody writes .css without a framework these days. We should use Bootstrap."
    ],
    [
      "'jquery-rails'", "We need jquery for Bootstrap"
    ],
    ["'devise'", "User authentication is a fascinating subject and you should learn as much about it as you can, and learn how to handle it on your own, if you decide you like developing. However Devise, maintained by Plataformatec, is a terrific gem that lets us move fast and will keep us from making too many bad decisions."
    ]
  ]

  @proscrypt_gems.each do |gem, suggestion, reflect|

    it "must have added #{gem} to Gemfile" do
      file = "Gemfile"
      code = "gem #{gem}"
      assert File.read(file).match(code), koan(
        suggestion,
        file: file,
        code: code,
        placement: "just below line 39 and then run 'bundle' from inside your web container shell",
        command: "bundle",
        reflect: @koans.group)
    end
  end
end
