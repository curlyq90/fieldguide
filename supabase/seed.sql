-- Field Guide Seed Data
-- Run this in the Supabase SQL Editor AFTER schema.sql
-- 75 organizations mapped to 7 categories with location data

INSERT INTO organizations (name, slug, description, homepage_url, category, city, state, region, is_starter) VALUES

-- =============================================================================
-- SEMESTER & EXPEDITION SCHOOLS (15)
-- =============================================================================
('High Mountain Institute', 'high-mountain-institute', 'Semester school in Leadville, CO. Wilderness expeditions meet rigorous academics.', 'https://www.hminet.org', 'semester-schools', 'Leadville', 'CO', 'Mountain West', false),
('North Cascades Institute', 'north-cascades-institute', 'Environmental education in WA''s North Cascades. Graduate programs and field seminars.', 'https://ncascades.org', 'semester-schools', NULL, 'WA', 'Pacific Northwest', false),
('Alzar School', 'alzar-school', 'Semester school in Idaho combining academics with river and mountain expeditions.', 'https://www.alzarschool.org', 'semester-schools', NULL, 'ID', 'Mountain West', false),
('Island School', 'island-school', 'Semester program in Eleuthera, Bahamas. Marine science, sustainability, place-based learning.', 'https://www.islandschool.org', 'semester-schools', 'Eleuthera', NULL, 'International', false),
('Four Corners School of Outdoor Education', 'four-corners-school', 'Field-based education on the Colorado Plateau. Archaeology, ecology, river trips.', 'https://www.fourcornersschool.org', 'semester-schools', NULL, NULL, 'Mountain West', false),
('CRMS', 'crms', 'Colorado Rocky Mountain School in Carbondale. Strong outdoor and experiential programs.', 'https://www.crms.org', 'semester-schools', 'Carbondale', 'CO', 'Mountain West', false),
('The Traveling School', 'the-traveling-school', 'Semester abroad for high school girls. Academics on the road with service and adventure.', 'https://www.thetravelingschool.com', 'semester-schools', NULL, NULL, 'International', false),
('Mountain School of Milton', 'mountain-school-of-milton', 'Semester program on a Vermont farm. Environmental science and community-based learning.', 'https://www.mountainschool.org', 'semester-schools', NULL, 'VT', 'Northeast', false),
('Outdoor Academy', 'outdoor-academy', 'Semester school in the Blue Ridge Mountains via Semester Schools Network.', 'https://www.semesterschools.net', 'semester-schools', NULL, 'NC', 'Southeast', false),
('Watershed School', 'watershed-school', 'Expeditionary learning school in Boulder, CO.', 'https://www.watershedschool.org', 'semester-schools', 'Boulder', 'CO', 'Mountain West', false),
('Wild Rockies Field Institute', 'wild-rockies-field-institute', 'Field courses in the Northern Rockies. Conservation biology, wilderness skills.', 'https://www.wrfi.net', 'semester-schools', NULL, 'MT', 'Mountain West', false),
('RIDGE Mountain Academy', 'ridge-mountain-academy', 'Therapeutic gap year combining outdoor adventure and academics.', 'https://www.ridgeacademy.com', 'semester-schools', NULL, NULL, NULL, false),
('Windells', 'windells', 'Action sports academy at Mt. Hood, OR.', 'https://www.windells.com', 'semester-schools', 'Mt. Hood', 'OR', 'Pacific Northwest', false),
('Boojum Institute', 'boojum-institute', 'Outdoor science school in Idyllwild, CA serving school groups.', 'https://www.boojum.org', 'semester-schools', 'Idyllwild', 'CA', 'West Coast', false),
('VVS (Verde Valley School)', 'vvs', 'Independent school in Sedona, AZ. Multicultural and outdoor experiential focus.', 'https://www.vvsaz.org', 'semester-schools', 'Sedona', 'AZ', 'Southwest', false),

-- =============================================================================
-- INDEPENDENT SCHOOLS (15)
-- =============================================================================
('Eagle''s Nest Foundation', 'eagles-nest-foundation', 'Progressive independent school with outdoor education woven into curriculum.', 'https://www.enf.org', 'independent-schools', NULL, NULL, NULL, false),
('Cascades Academy', 'cascades-academy', 'Independent school in Bend, OR with outdoor and place-based programs.', 'https://www.cascadesacademy.org', 'independent-schools', 'Bend', 'OR', 'Pacific Northwest', false),
('Vail Mountain School', 'vail-mountain-school', 'Independent school in Vail, CO integrating mountain culture and outdoor ed.', 'https://www.vms.edu', 'independent-schools', 'Vail', 'CO', 'Mountain West', false),
('Colorado Academy', 'colorado-academy', 'PreK–12 independent school in Denver with strong outdoor programming.', 'https://www.coloradoacademy.org', 'independent-schools', 'Denver', 'CO', 'Mountain West', false),
('The Odyssey School', 'the-odyssey-school', 'EL Education school in Denver. Expeditionary learning model.', 'https://www.odysseydenver.org', 'independent-schools', 'Denver', 'CO', 'Mountain West', false),
('Marin Academy', 'marin-academy', 'Independent school in San Rafael, CA.', 'https://www.ma.org', 'independent-schools', 'San Rafael', 'CA', 'West Coast', false),
('Lakeside School', 'lakeside-school', 'Independent school in Seattle, WA.', 'https://www.lakesideschool.org', 'independent-schools', 'Seattle', 'WA', 'Pacific Northwest', false),
('Chadwick School', 'chadwick-school', 'Independent K–12 school in Palos Verdes, CA.', 'https://www.chadwickschool.org', 'independent-schools', 'Palos Verdes', 'CA', 'West Coast', false),
('Albuquerque Academy', 'albuquerque-academy', 'Independent school in Albuquerque, NM.', 'https://www.aa.edu', 'independent-schools', 'Albuquerque', 'NM', 'Southwest', false),
('The Bush School', 'the-bush-school', 'K–12 independent school in Seattle.', 'https://www.bush.edu', 'independent-schools', 'Seattle', 'WA', 'Pacific Northwest', false),
('Logan School for Creative Learning', 'logan-school', 'School for gifted learners in Denver, CO.', 'https://www.theloganschool.org', 'independent-schools', 'Denver', 'CO', 'Mountain West', false),
('Fort Lewis College', 'fort-lewis-college', 'Public college in Durango, CO with adventure education and outdoor rec programs.', 'https://www.fortlewis.edu', 'independent-schools', 'Durango', 'CO', 'Mountain West', false),
('Seattle University', 'seattle-university', 'Jesuit university in Seattle.', 'https://www.seattleu.edu', 'independent-schools', 'Seattle', 'WA', 'Pacific Northwest', false),
('Blueprint Schools Network', 'blueprint-schools-network', 'Network supporting high-performing schools in underserved communities.', 'https://www.blueprintschools.org', 'independent-schools', NULL, NULL, 'National / Remote', false),
('EL Education', 'el-education', 'National network of expeditionary learning schools. Core practices framework.', 'https://eleducation.org', 'independent-schools', NULL, NULL, 'National / Remote', false),

-- =============================================================================
-- OUTDOOR EDUCATION PROGRAMS (14)
-- =============================================================================
('Colorado Outward Bound School', 'colorado-outward-bound-school', 'Wilderness expeditions and leadership courses. The OG of outdoor education.', 'https://www.cobs.org', 'outdoor-ed-programs', NULL, 'CO', 'Mountain West', true),
('Where There Be Dragons', 'where-there-be-dragons', 'Gap year and summer programs in Asia, Latin America, and Africa.', 'https://www.wheretherebedragons.com', 'outdoor-ed-programs', NULL, NULL, 'International', false),
('Carpe Diem Education', 'carpe-diem-education', 'Gap year and semester programs abroad with experiential learning and service.', 'https://www.carpediemeducation.org', 'outdoor-ed-programs', NULL, NULL, 'International', false),
('Rustic Pathways', 'rustic-pathways', 'Student travel: service, adventure, and cultural immersion worldwide.', 'https://rusticpathways.com', 'outdoor-ed-programs', NULL, NULL, 'International', false),
('Deer Hill Expeditions', 'deer-hill-expeditions', 'Wilderness adventures for teens in the Southwest. Service, backpacking, rafting.', 'https://www.deerhillexpeditions.com', 'outdoor-ed-programs', NULL, NULL, 'Southwest', false),
('Broadreach', 'broadreach', 'Adventure programs abroad for teens: marine biology, scuba, sailing, wildlife.', 'https://www.gobroadreach.com', 'outdoor-ed-programs', NULL, NULL, 'International', false),
('Kroka Expeditions', 'kroka-expeditions', 'Expedition-based education in NH. Canoe, dogsled, and wilderness journeys.', 'https://www.kroka.org', 'outdoor-ed-programs', NULL, 'NH', 'Northeast', false),
('Putney Student Travel', 'putney-student-travel', 'Summer programs abroad for teens: language, community service, exploration.', 'https://www.goputney.com', 'outdoor-ed-programs', NULL, NULL, 'International', false),
('GoBeyond Student Travel', 'gobeyond-student-travel', 'International teen travel with service learning and adventure.', 'https://www.gobeyondtravel.com', 'outdoor-ed-programs', NULL, NULL, 'International', false),
('Walking Tree Travel', 'walking-tree-travel', 'Youth adventure travel and cultural exchange programs.', 'https://walkingtree.org', 'outdoor-ed-programs', NULL, NULL, NULL, false),
('VISIONS Service Adventures', 'visions-service-adventures', 'Teen summer service and cross-cultural programs in the U.S. and abroad.', 'https://www.visionsserviceadventures.com', 'outdoor-ed-programs', NULL, NULL, 'National / Remote', false),
('Lifeworks International', 'lifeworks-international', 'Community service travel programs for teens.', 'https://www.gobeyondtravel.com', 'outdoor-ed-programs', NULL, NULL, 'International', false),
('Insight Adventures', 'insight-adventures', 'Adventure tours, outdoor education, corporate events, and certified training.', 'https://www.insight-adventures.com', 'outdoor-ed-programs', NULL, NULL, NULL, false),
('World Challenge', 'world-challenge', 'Expedition programs for students. Leadership through adventure in remote locations.', 'https://weareworldchallenge.com', 'outdoor-ed-programs', NULL, NULL, 'International', false),

-- =============================================================================
-- NONPROFITS & ACCESS ORGS (10)
-- =============================================================================
('Big City Mountaineers', 'big-city-mountaineers', 'Free wilderness mentoring trips for under-resourced urban youth.', 'https://www.bigcitymountaineers.org', 'nonprofits', NULL, NULL, 'National / Remote', false),
('First Descents', 'first-descents', 'Outdoor adventures for young adults impacted by cancer and other serious health conditions.', 'https://firstdescents.org', 'nonprofits', NULL, NULL, 'National / Remote', false),
('GirlVentures', 'girlventures', 'Outdoor programs building confidence and leadership in girls and non-binary youth.', 'https://www.girlventures.org', 'nonprofits', NULL, 'CA', 'West Coast', false),
('Wilderness Inquiry', 'wilderness-inquiry', 'Inclusive outdoor adventures making the wilderness accessible to everyone.', 'https://www.wildernessinquiry.org', 'nonprofits', 'Minneapolis', 'MN', 'Midwest', false),
('SOS Outreach', 'sos-outreach', 'Mentoring under-served youth through outdoor sports like skiing and snowboarding.', 'https://www.sosoutreach.org', 'nonprofits', NULL, 'CO', 'Mountain West', false),
('Environmental Traveling Companions', 'environmental-traveling-companions', 'Outdoor trips for people with disabilities, at-risk youth, and low-income communities.', 'https://www.etctrips.org', 'nonprofits', 'San Francisco', 'CA', 'West Coast', false),
('Common Ground Outdoor Adventures', 'common-ground-outdoor-adventures', 'Outdoor recreation for youth and adults with disabilities.', 'https://cgadventures.org', 'nonprofits', NULL, NULL, NULL, false),
('No Barriers USA', 'no-barriers-usa', 'Programs helping people with challenges live barrier-breaking lives through outdoor experiences.', 'https://www.nobarriersusa.org', 'nonprofits', NULL, 'CO', 'Mountain West', false),
('Women''s Wilderness', 'womens-wilderness', 'Outdoor programs empowering women and girls through wilderness experiences.', 'https://www.womenswilderness.org', 'nonprofits', 'Boulder', 'CO', 'Mountain West', false),
('Outdoors for All Foundation', 'outdoors-for-all-foundation', 'Adaptive and inclusive outdoor recreation programs in the Pacific Northwest.', 'https://www.outdoorsforall.org', 'nonprofits', 'Seattle', 'WA', 'Pacific Northwest', false),

-- =============================================================================
-- ADVENTURE & OUTDOOR COMPANIES (8)
-- =============================================================================
('Backroads', 'backroads', 'Active travel company: biking, hiking, and multi-adventure trips worldwide.', 'https://www.backroads.com', 'companies', 'Berkeley', 'CA', 'West Coast', false),
('GeoEx Adventure Travel', 'geoex-adventure-travel', 'Luxury custom adventure travel to remote destinations.', 'https://www.geoex.com', 'companies', 'San Francisco', 'CA', 'West Coast', false),
('Adventure Life', 'adventure-life', 'Small-group adventure travel in Latin America, Antarctica, and beyond.', 'https://www.adventure-life.com', 'companies', 'Missoula', 'MT', 'Mountain West', false),
('Global Works Travel', 'global-works-travel', 'Service-adventure travel programs for teens and college students.', 'https://www.globalworkstravel.com', 'companies', NULL, NULL, 'International', false),
('Teton Gravity Research', 'teton-gravity-research', 'Action sports media company in Jackson Hole. Film, content, events.', 'https://www.tetongravity.com', 'companies', 'Jackson', 'WY', 'Mountain West', false),
('Evergreen Outdoor Center', 'evergreen-outdoor-center', 'Outdoor education and adventure programs in Hakuba, Japan.', 'https://www.evergreen-hakuba.com', 'companies', 'Hakuba', NULL, 'International', false),
('LOGE', 'loge', 'Outdoor hospitality: adventure-oriented lodges near trailheads and ski areas.', 'https://www.logecamps.com', 'companies', NULL, NULL, 'National / Remote', false),
('Ragnar', 'ragnar', 'Overnight relay running races across the U.S. Events, community, trail and road.', 'https://www.runragnar.com', 'companies', NULL, NULL, 'National / Remote', false),

-- =============================================================================
-- INDUSTRY ORGS & JOB BOARDS (8)
-- =============================================================================
('Association for Experiential Education', 'aee', 'Professional association for experiential educators. Conferences, accreditation, job board.', 'https://www.aee.org', 'industry-orgs', NULL, NULL, 'National / Remote', false),
('Outdoor Industry Career Center', 'outdoor-industry-career-center', 'Job board for the outdoor recreation and active lifestyle industries.', 'https://www.outdoorindustry.org', 'industry-orgs', NULL, NULL, 'National / Remote', false),
('NOLS Jobs Network', 'nols-jobs-network', 'Job listings from the National Outdoor Leadership School and partners.', 'https://www.nols.edu', 'industry-orgs', 'Lander', 'WY', 'Mountain West', true),
('American Avalanche Association', 'american-avalanche-association', 'Pro employment list for avalanche professionals: forecasters, educators, patrol.', 'https://www.americanavalancheassociation.org', 'industry-orgs', NULL, NULL, 'National / Remote', false),
('NWAIS', 'nwais', 'NW Association of Independent Schools job board across the Pacific Northwest.', 'https://www.nwais.org', 'industry-orgs', NULL, NULL, 'Pacific Northwest', false),
('OA Outdoor & Environmental Careers', 'oa-outdoor-careers', 'Job listings in outdoor education, environmental science, and conservation.', 'https://www.outdooradventurejobs.com', 'industry-orgs', NULL, NULL, 'National / Remote', false),
('CoolWorks', 'coolworks', 'Job board for seasonal outdoor work: national parks, ski resorts, ranches, lodges.', 'https://www.coolworks.com', 'industry-orgs', NULL, NULL, 'National / Remote', true),
('Short-Term Job Adventures', 'short-term-job-adventures', 'Resource for seasonal outdoor, resort, and adventure employment.', 'https://www.backdoorjobs.com', 'industry-orgs', NULL, NULL, 'National / Remote', false);
