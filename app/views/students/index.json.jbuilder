json.array! @students do |student|
  json.extract! student, *student.attributes.keys
  json.advisor student.advisor
  if student.plan.concentration
    json.concentration student.plan.concentration.name
    json.thesis_starts friendly_date(student.plan.thesis_starts)
    json.graduation_date student.plan.graduation_term.titleize + ' ' + student.plan.graduation_year.to_s
  end
  json.currently_registered student.plan.latest_registered
  json.registration_date student.plan.registration_date
end