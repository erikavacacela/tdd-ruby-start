# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    remove_extra_spaces("#{@first_name} #{@middle_name} #{@last_name}")
  end

  def full_name_with_middle_initial
    remove_extra_spaces("#{@first_name} #{@middle_name[0].concat('.') if @middle_name} #{@last_name}")
  end

  def initials
    "#{@first_name[0]}#{@middle_name[0] if @middle_name}#{@last_name[0]}"
  end
  
  def remove_extra_spaces(custom_string)
    custom_string.sub('  ', ' ')
  end
end
  
RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      expected_full_name = 'Augusta Ada King'
      person = Person.new(:first_name => 'Augusta', :middle_name => 'Ada', :last_name => 'King')

      actual_full_name = person.full_name()

      expect(actual_full_name).to eq(expected_full_name)
    end

    it "does not add extra spaces if middle name is missing" do
      expected_full_name = 'Eduardo Cachavilano'
      person = Person.new(:first_name => 'Eduardo', :last_name => 'Cachavilano')

      actual_full_name = person.full_name()

      expect(actual_full_name).to eq(expected_full_name)
    end
  end

  describe "#full_name_with_middle_initial" do
    it "returns a full name with a middle initial with spaces" do
      expected_full_name = 'Valentin W. Oliva'
      person = Person.new(:first_name => 'Valentin', :middle_name => 'Wos', :last_name => 'Oliva')

      actual_full_name = person.full_name_with_middle_initial()

      expect(actual_full_name).to eq(expected_full_name)
    end 

    it "does not add extra spaces if middle name is missing" do
      expected_full_name = 'Valentin Oliva'
      person = Person.new(:first_name => 'Valentin', :last_name => 'Oliva')

      actual_full_name = person.full_name_with_middle_initial()

      expect(actual_full_name).to eq(expected_full_name)
    end 

  end

  describe "#initials" do
    it "concatenates the initials of first name, middle name, and last name" do
      expected_initials = 'AAK'
      person = Person.new(:first_name => 'Augusta', :middle_name => 'Ada', :last_name => 'King')

      actual_initials = person.initials()

      expect(actual_initials).to eq(expected_initials)
    end

    it "shows two characters, if middle name is missing" do
      expected_initials = 'AK'
      person = Person.new(:first_name => 'Augusta', :last_name => 'King')

      actual_initials = person.initials()

      expect(actual_initials).to eq(expected_initials)
    end      
  end
end