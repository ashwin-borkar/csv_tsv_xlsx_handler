# test/csv_tsv_xlsx_handler_test.rb
require 'minitest/autorun'
require 'csv_tsv_xlsx_handler'

class CsvTsvXlsxHandlerTest < Minitest::Test
  def setup
    # Sample data for testing
    @csv_data = [
      { "Name" => "Alice", "Age" => "30", "City" => "New York" },
      { "Name" => "Bob", "Age" => "25", "City" => "Los Angeles" }
    ]
  end

  def test_read_and_write_csv
    # Write CSV
    CsvTsvXlsxHandler.write_csv('test.csv', @csv_data)
    
    # Read CSV
    result = CsvTsvXlsxHandler.read_csv('test.csv')

    # Verify the content
    assert_equal @csv_data, result
  end

  # Add similar tests for TSV and XLSX
end
