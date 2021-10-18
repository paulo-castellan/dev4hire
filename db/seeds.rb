expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
jonas_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                previous_experience: 'Estágio com backend na XX consult',
                                dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')

peter = Dev.create!(email: 'peter@parker.com', password: 123456)
peter_profile = DevProfile.create!(full_name: 'Peter Parker', social_name: 'Spider-man',
                                date_of_birth: '14/05/1995', academic_education: 'Curso tecnológico em computação',
                                previous_experience: 'Freelancer em vários pequenos projetos',
                                dev: peter, expertise: expertise, description: 'Nascido para vencer e codar')

jane = Dev.create!(email: 'jane@doe.com', password: 123456)
jane_profile = DevProfile.create!(full_name: 'Jane Doe', social_name: 'Fake Woman',
                                  date_of_birth: '05/03/1978', academic_education: 'Graduação, Mestrado e Doutorado em aplicações web de alto rendimento',
                                  previous_experience: 'Multiplas empresas de tecnólogia, 20 anos de experiência em desenvolvimento Web',
                                  dev: jane, expertise: expertise, description: 'Codo e vivo a vida, a muito tempo')

work_type = WorkType.create!(description: 'Remoto')

user = User.create!(email: 'user@user.com', password: 123456)

project = Project.create!(title: 'Aplicação web Front/Back-end', detailed_description: 'Nesse projeto equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                          skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                          max_payment_per_hour: 1000, work_type: work_type, user: user)
Project.create!(title: 'Suporte Back-end', detailed_description: 'Esse projeto necessita de uma grande quantidade de dev back-end para expansão de aplicação web',
                            skill_sets: 'Laravel/Node.js', hire_date_limit: 5.days.from_now,
                            max_payment_per_hour: '500', work_type: work_type, user: user)
Project.create!(title: 'Front-end Needed', detailed_description: 'Estamos procurando por Devs freelancers para realizarem a criação de telas temáticas URGENTE!',
                              skill_sets: 'React JS/Vue JS', hire_date_limit: 3.days.from_now,
                              max_payment_per_hour: '150', work_type: work_type, user: user)
ProjectProposition.create!(motivation: 'Quero dinheiro', expected_payment: 200,
                          available_hours_per_week: 30, expectations: 'Desenvolver minhas habilidades de dev',
                          dev: jonas, project: project)
ProjectProposition.create!(motivation: 'Em busca de aprender a codar mais e melhor todos dias', expected_payment: 100,
                          available_hours_per_week: 30, expectations: 'Estou em transição de carreira, espero uma equipe que me ajude a crescer',
                          dev: peter, project: project)
ProjectProposition.create!(motivation: 'Tempo disponível, estou em busca de novos projetos', expected_payment: 800,
                          available_hours_per_week: 10, expectations: 'Conhecer novos devs, e coordenar equipes com variada capacidade',
                          dev: jane, project: project)

jonas_profile.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed_images/profile_image.jpg')), filename: 'profile_image.jpg', content_type: 'image/jpg')
peter_profile.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed_images/profile_image2.jpg')), filename: 'profile_image2.jpg', content_type: 'image/jpg')
jane_profile.avatar.attach(io: File.open(Rails.root.join('app/assets/images/seed_images/profile_image3.jpg')), filename: 'profile_image3.jpg', content_type: 'image/jpg')