class Frullato

  def folder path
    Dir.foreach("./#{path}") do |sub_folder|
      if FolderUtils.good_for_renaming? sub_folder
        self.explore_sub_folder path, sub_folder
      end
    end
  end

  def explore_sub_folder _folder, _sub_folder
    counter = 1
    Dir.foreach("./#{_folder}/#{_sub_folder}") do |element|
      p element
      p counter
      counter += 1
    end
  end

  def is_good_folder? str

  end
end

class FolderUtils
  def self.good_for_renaming? str
    lib = ['.','..','.git','.DS_Store']
    return false if lib.include? str
    return false if File.file?(str)
    return true
  end
end

p "-------------------"
p " Enter the folder: "
p "-------------------"
frullato = Frullato.new
frullato.folder gets.chomp
