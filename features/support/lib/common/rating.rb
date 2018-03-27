module Stamps
  class Rating < WebApps::Base
    def spreadsheet
      cache[:spreadsheet].nil? ? cache[:spreadsheet] = SpreadSheet.new(param) : cache[:spreadsheet]
    end
  end

  class SpreadSheet < WebApps::Base
    def source_file
      "#{data_for(:rates_test, {})['source_dir']}\\#{data_for(:rates_test, {})['rate_file']}"
    end

    def test_file
      "#{data_for(:rates_test, {})['test_dir']}\\#{data_for(:rates_test, {})['rate_file']}"
    end

    def update
      update_file unless updated?
      updated?
    end

    def updated?
      return false unless File.file?(test_file)
      FileUtils.compare_file(source_file, test_file)
    end

    def update_file
      begin
        FileUtils.copy_file(source_file, test_file)
        SdcTest.log.step "#{"-"*40}"
        SdcTest.log.step "Rate File was Updated"
        SdcTest.log.step "#{"-"*40}"
      rescue
        false
      end
      true
    end
  end
end