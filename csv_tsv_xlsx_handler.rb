# lib/csv_tsv_xlsx_handler.rb

require 'csv'
require 'rubyXL'

module CsvTsvXlsxHandler
  # Reads a CSV file and returns the data as an array of hashes
  def self.read_csv(file_path)
    result = []
    CSV.foreach(file_path, headers: true, encoding: 'UTF-8') do |row|
      result << row.to_hash
    end
    result
  end

  # Writes data to a CSV file
  def self.write_csv(file_path, data)
    CSV.open(file_path, "wb", encoding: 'UTF-8') do |csv|
      # Write headers (assuming the first row contains the keys)
      csv << data.first.keys
      data.each do |row|
        csv << row.values
      end
    end
  end

  # Reads a TSV file and returns the data as an array of hashes
  def self.read_tsv(file_path)
    result = []
    CSV.foreach(file_path, headers: true, col_sep: "\t", encoding: 'UTF-8') do |row|
      result << row.to_hash
    end
    result
  end

  # Writes data to a TSV file
  def self.write_tsv(file_path, data)
    CSV.open(file_path, "wb", col_sep: "\t", encoding: 'UTF-8') do |csv|
      # Write headers (assuming the first row contains the keys)
      csv << data.first.keys
      data.each do |row|
        csv << row.values
      end
    end
  end

  # Reads an XLSX file and returns the data as an array of hashes
  def self.read_xlsx(file_path)
    result = []
    workbook = RubyXL::Parser.parse(file_path)
    worksheet = workbook[0] # Accessing the first sheet

    headers = worksheet[0].cells.map(&:value) # First row as headers

    worksheet.each_with_index do |row, index|
      next if index == 0  # Skip the header row
      row_hash = Hash[headers.zip(row.cells.map { |cell| cell.value.to_s.encode('UTF-8') })]
      result << row_hash
    end

    result
  end

  # Writes data to an XLSX file
  def self.write_xlsx(file_path, data)
    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]

    # Write headers (first row)
    headers = data.first.keys
    worksheet.add_row(headers)

    # Write data (remaining rows)
    data.each do |row|
      worksheet.add_row(row.values.map { |value| value.to_s.encode('UTF-8') })
    end

    workbook.write(file_path)
  end
end
