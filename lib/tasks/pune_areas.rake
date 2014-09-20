require 'fake_data'
namespace :areas do
  task :add_pune => :environment do
    area_w_pincode = [["Akurdi", "411035"], ["Lohgaon", "411047"], ["Anandnagar", "411051"], ["Market Yard", "411037"], ["Armament", "411021"], ["Model Colony", "411016"], ["Aundh Camp", "411027"], ["Mundhwa", "411036"], ["Bhosari", "411026"], ["Bhosari Gaon", "411039"], ["Chinchwad Gaon", "411033"], ["Navasahyadri", "411052"], ["Chinchwad", "411019"], ["Parvati", "411009"], ["Dapodi", "411012"], ["Pashan", "411045"], ["Deccan", "411004"], ["Pimpri", "411044"], ["Dhankawadi", "411043"], ["Ganeshkhind", "411007"], ["Range Hill", "411020"], ["Hadapsar", "411013"], ["S.P. College", "411030"], ["Hadapsar", "411028"], ["Shivaji Hsg Society", "411053"], ["Kasba Peth", "411011"], ["Shivajinagar", "411005"], ["Kasarwadi", "411034"], ["Swargate", "411042"], ["Katraj", "411046"], ["Wadgaon Budruk", "411041"], ["Khadakwasala", "411024"], ["Wanawadi", "411040"], ["Khadaki", "411020"], ["Warje Malwadi", "411052"], ["Kothrud", "411038"], ["Yerawada", "411006"]]

    area_w_pincode.each do |a|
      Area.create(name: a.first.downcase.strip, zipcode: a.last, city: "pune")
    end
  end
end

namespace :fake do
  task :doctor => :environment do
    FakeData.doctor(ENV['size'].to_i)
  end
end