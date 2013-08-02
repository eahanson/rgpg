require 'securerandom'
if RUBY_VERSION < '1.9.0'
  require File.expand_path('../test_helper', __FILE__)
else
  require_relative 'test_helper'
end

module RgpgTest
  class GpgHelperTest < Test::Unit::TestCase
    def test_encrypt_and_decrypt
      public_key_file_name = File.expand_path('../test-key.pub', __FILE__)
      private_key_file_name = File.expand_path('../test-key.sec', __FILE__)
      test_string = SecureRandom.base64

      self.class.with_temp_files(3) do |input_file, encrypted_file, decrypted_file|
        File.open(input_file.path, 'w') do |f|
          f.write(test_string)
        end

        Rgpg::GpgHelper.encrypt_file(
          public_key_file_name,
          input_file.path,
          encrypted_file.path
        )
        Rgpg::GpgHelper.decrypt_file(
          public_key_file_name,
          private_key_file_name,
          encrypted_file.path,
          decrypted_file.path
        )

        assert_equal test_string, File.read(decrypted_file.path)
      end
    end

    private

    def self.with_temp_files(count)
      begin
        temp_files = []
        count.times do |index|
          temp_file = Tempfile.new("rgpg-test-gpg-helper-temp-#{index}")
          temp_files << temp_file
          temp_file.close
        end

        yield temp_files

      ensure
        while temp_files.size > 0
          temp_file = temp_files.pop
          temp_file.close
          temp_file.unlink
        end
      end
    end
  end
end

