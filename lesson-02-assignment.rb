#QUESTION 1 
Trimester.create(year: '2026', term: 'Spring', application_deadline: '2026-02-15', start_date: '2026-03-01', end_date: '2026-05-31')
#TRANSACTION (0.0ms)  BEGIN immediate TRANSACTION /*application='DocRails'*/
#Trimester Create (0.6ms)  INSERT INTO "trimesters" ("year", "term", "application_deadline", "start_date", "end_date", "created_at", "updated_at") VALUES ('2026', 'Spring', '2026-02-15', '2026-03-01', '2026-05-31', '2025-07-26 00:58:13.910265', '2025-07-26 00:58:13.910265') RETURNING "id" /*application='DocRails'*/
#TRANSACTION (0.2ms)  COMMIT TRANSACTION /*application='DocRails'*/
#<Trimester:0x000000010720c828
 id: 9,
 year: "2026",
 term: "Spring",
 application_deadline: "2026-02-15",
 start_date: "2026-03-01",
 end_date: "2026-05-31",
 created_at: "2025-07-26 00:58:13.910265000 +0000",
 updated_at: "2025-07-26 00:58:13.910265000 +0000">

 spring_2026 = Trimester.find_by(year: '2026', term: 'Spring')

 CodingClass.find_each do |coding_class|
  puts "Creating new course for #{coding_class.title}"
  Course.create!(
    coding_class_id: coding_class.id,
    trimester_id: spring_2026.id,
    max_enrollment: 25
  )
  puts "Created course for #{coding_class.title}"
 end

 #QUESTION 2

 Student.create!(
  first_name: "Alisha",
  last_name: "Walker",
  email: "alisha.walker@testam-net.com"
 )
 course = Course.find(1)
 student = Student.last
 enrollment = Enrollment.create!(
  student: student,
  course: course
 )
 mentor = Mentor.left_joins(:enrollments)
          .group('mentors.id')
          .having('COUNT(enrollments.id) <=2')
          .first

MentorEnrollmentAssignment.create!(
  mentor: mentor,
  enrollment: enrollment
)

#Question 3 - Describe your project. I can't come up with an idea at this stage, so I will be using the idea with journalling

#Who are the users of your application?
# anyone
#What are the core user scenarios or features of your app? 
# a user can write journal entries
# choose to set them private or public
# open/close comments

#Question 4 - Design the data model for your project
#Journal admin, journal writer, journal name, guest, comment, public, private, email, created at, updated at

#Tables names, columns names
#1. Journal writer: id; name, email, created at, updated at
#2. Entry: id, title, content, mood, user id, created at, updated at
#3. Tags: id, name, created at, updated at
#4. Entry tag: id, entry id, tag id, created at, updated at
