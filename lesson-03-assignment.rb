#1. What tables do you need to add? Decide on table names and their associations to each other and any existing tables/models.
#A: Some courses can have many topics. A topic can have many lessons, and a lesson can have different topics. 
#   Relationship btw topics and lessons is many-to-many. So we have a Lessons table, need a Topics table, and a joint table LessonTopics
#.  Topics table will hold names of topics;
#.  LessonTopics will connect through lesson_id and topic_id
#generate models
#  rails g model Topic title:string
#  rails g model LessonTopic lesson:references topic:references
# Create topics
#Topic.create!(title: "Javascript")
#Topic.create!(title: "CSS")
#Topic.create!(title: "Automated Testing")
#Topic.create!(title: "Debugging")
#Topic.create!(title: "Web Request Cycle")
#Topic.create!(title: "HTTP")
#Topic.create!(title: "SQL")
#Topic.create!(title: "Data Modeling")
# query CodingClass to find classes, then Courses tables
#Front end
#intro_class = CodingClass.find_by!(title: "Intro to Programming")
#intro_courses = Course.where(coding_class_id: intro_class.id)
#intro_lessons = Lesson.where(course_id: intro_courses.pluck(:id)).order(:lesson_number)
#react_class = CodingClass.find_by!(title: "React")
#react_courses = Course.where(coding_class_id: react_class.id)
#react_lessons = Lesson.where(course_id: react_courses.pluck(:id)).order(:lesson_number)
#css = Topic.find_by(title: "CSS")
#intro_lessons.each do |lesson|
   #lesson.topics << css unless lesson.topics.include?(css)
# end
#react_lessons.each do |lesson|
   #lesson.topics << css unless lesson.topics.include?(css)
#end
#js = Topic.find_by(title: "JavaScript")
#intro_lessons.each do |lesson|
   #lesson.topics << js unless lesson.topics.include?(js)
# end
#react_lessons.each do |lesson|
   #lesson.topics << js unless lesson.topics.include?(js)
#end

#Backend
#ruby_class = CodingClass.find_by(title: "Ruby on Rails")
#python_class = CodingClass.find_by(title: 'Python')
#node_class = CodingClass.find_by(title: 'NodeJS')
#ruby_courses = Course.where(coding_class_id: ruby_class.id)
#python_courses = Course.where(coding_class_id: python_class.id)
#node_courses = Course.where(coding_class_id: node_class.id)
#ruby_lessons = Lesson.where(course_id: ruby_courses.pluck(:id)).order(:lesson_number)
#python_lessons = Lesson.where(course_id: python_courses.pluck(:id)).order(:lesson_number)
#node_lessons = Lesson.where(course_id: node_courses.pluck(:id)).order(:lesson_number)

#These I will include into backend topics, find them
#data_modeling = Topic.find_by(title: "Data Modeling")
#web_request_cycle = Topic.find_by(title: "Web Request Cycle")
#http = Topic.find_by(title: "HTTP")
#debugging = Topic.find_by(title: "Debugging")
#automated_testing = Topic.find_by(title: "Automated Testing")
#sql = Topic.find_by(title: "SQL")

#Add them into ruby lessons
#ruby_lessons.each do |lesson|
  #[data_modeling, web_request_cycle, http, debugging, automated_testing, sql].each do |topic|
    #lesson.topics << topic unless lesson.topics.include?(topic)
  #end
#end

#node_lessons.each do |lesson|
  #[data_modeling, web_request_cycle, http, debugging, automated_testing, sql].each do |topic|
    #lesson.topics << topic unless lesson.topics.include?(topic)
  #end
#end

#python_lessons.each do |lesson|
  #[data_modeling, web_request_cycle, http, debugging, automated_testing, sql].each do |topic|
    #lesson.topics << topic unless lesson.topics.include?(topic)
  #end
#end


#What columns are necessary for the associations you decided on?
#A: topic names; lesson_id and topic_id in the join table
#What other columns (if any) need to be included on the tables? What other data needs to be stored?
#A: I don't think tht topics table needs any other cols, timestamps are created automatically
# as well as lessontopic table, it needs to have only keys for lessons and topics
#Write out each table's name and column names with data types.
#A:  Topics table: id - integer; title - string for names; created_at and updated_at
# Lesson_Topics table: id - integer; lesson_id - integer, references Lessons table; topic_id - integer; references Topics table. Created_at and Updated_at
