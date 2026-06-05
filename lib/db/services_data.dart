import '../models/service_model.dart';

final List<Map<String, dynamic>> rawCategoriesEn = [
  {
    'name': "Car Wrapping Services",
    'image': 'assets/images/services/1.webp',
    'description':
        "Transform your vehicle with our professional wrapping solutions — from vibrant business branding to sleek color changes and full fleet wraps. We use top-quality vinyls for lasting results.",
    'subcategories': [
      {
        'name': "Car Branding",
        'image': 'assets/images/sub-services/1.1.webp',
        'desc':
            "Promote your brand with precision-designed car wraps. Our durable vinyls deliver bold visuals and a flawless finish, turning every drive into a marketing opportunity.",
        'materials': [
          {'name': "Gloss Vinyl Film (3M / Avery / Oracal)", 'ratePerSqFt': 10},
          {'name': "Matte Vinyl Film", 'ratePerSqFt': 12},
          {'name': "Color-Shift / Chrome Vinyl", 'ratePerSqFt': 18},
          {'name': "Cast Vinyl (Premium Long-Lasting)", 'ratePerSqFt': 15},
        ],
      },
      {
        'name': "Change Color",
        'image': 'assets/images/sub-services/1.2.webp',
        'desc':
            "Revamp your vehicle’s appearance with a complete color change. Choose from glossy, matte, or metallic wraps that enhance aesthetics while protecting your factory paint.",
        'materials': [
          {'name': "Gloss Finish Wrap", 'ratePerSqFt': 11},
          {'name': "Matte Finish Wrap", 'ratePerSqFt': 13},
          {'name': "Satin Metallic Wrap", 'ratePerSqFt': 16},
          {'name': "Chrome / Color-Shift Wrap", 'ratePerSqFt': 20},
        ],
      },
      {
        'name': "Fleet Branding",
        'image': 'assets/images/sub-services/1.7.webp',
        'desc':
            "Ensure consistent and professional branding across all company vehicles. Our large-format vinyl graphics are UV-resistant and designed for long-term durability and clarity.",
        'materials': [
          {'name': "Printable Vinyl Film (Commercial Use)", 'ratePerSqFt': 9},
          {'name': "Laminated Vinyl Film", 'ratePerSqFt': 11},
          {'name': "High-Durability Cast Vinyl", 'ratePerSqFt': 14},
          {'name': "Reflective Vinyl (Safety / Visibility)", 'ratePerSqFt': 17},
        ],
      },
      {
        'name': "Peelable Paints",
        'image': 'assets/images/sub-services/1.5.webp',
        'desc':
            "Experience temporary yet durable color customization with peelable paints. Available in gloss, matte, or chrome finishes — easily removable without damaging your original paint.",
        'materials': [
          {'name': "Gloss Finish Peelable Paint", 'ratePerSqFt': 18},
          {'name': "Matte Finish Peelable Paint", 'ratePerSqFt': 20},
          {'name': "Chrome / Special Effect Peelable Paint", 'ratePerSqFt': 35},
        ],
      },
      {
        'name': "RTA Approvals & Passing",
        'image': 'assets/images/sub-services/1.6.webp',
        'desc':
            "Get complete support for RTA approval and passing after modifications or color changes. We handle documentation and compliance to ensure a smooth, hassle-free process.",
        'materials': [
          {'name': "Color Change Approval", 'rate': 400},
          {'name': "Full Passing & Registration Support", 'rate': 600},
        ],
      },
    ],
  },
  {
    'name': "Car Tinting And Protection",
    'image': 'assets/images/services/6.webp',
    'description':
        "Enhance comfort and preserve your vehicle’s appearance with premium tinting and protection solutions — from heat-resistant window films to paint protection and ceramic coatings.",
    'subcategories': [
      {
        'name': "Window Tinting",
        'image': 'assets/images/sub-services/6.1.webp',
        'desc':
            "Improve cabin comfort, reduce glare, and block harmful UV rays with our high-performance window films. Choose from standard, ceramic, or nano-ceramic options for the perfect shade.",
        'materials': [
          {'name': "Standard Dyed Film", 'ratePerSqFt': 5},
          {'name': "Carbon Tint Film", 'ratePerSqFt': 8},
          {'name': "Ceramic Tint Film", 'ratePerSqFt': 12},
          {'name': "Nano-Ceramic Heat Rejection Film", 'ratePerSqFt': 15},
        ],
      },
      {
        'name': "Paint Protection Film (PPF)",
        'image': 'assets/images/sub-services/6.2.webp',
        'desc':
            "Shield your car’s paint from scratches, chips, and weather damage using transparent paint protection film. Designed for durability and clarity, keeping your car looking new for years.",
        'materials': [
          {'name': "Gloss PPF (Standard)", 'ratePerSqFt': 18},
          {'name': "Matte PPF (Satin Finish)", 'ratePerSqFt': 20},
          {'name': "Self-Healing PPF", 'ratePerSqFt': 25},
          {'name': "Ceramic-Coated PPF", 'ratePerSqFt': 28},
        ],
      },
      {
        'name': "Ceramic Coating",
        'image': 'assets/images/sub-services/6.3.webp',
        'desc':
            "Add long-lasting shine and protection with nano-ceramic coating. It repels dirt, enhances gloss, and forms a strong barrier against UV rays, oxidation, and environmental contaminants.",
        'materials': [
          {'name': "1-Year Ceramic Coating", 'ratePerSqFt': 10},
          {'name': "3-Year Ceramic Coating", 'ratePerSqFt': 14},
          {'name': "5-Year Ceramic Coating", 'ratePerSqFt': 18},
          {'name': "Graphene Ceramic Coating", 'ratePerSqFt': 22},
        ],
      },
    ],
  },
  {
    'name': "Interior Fitouts",
    'image': 'assets/images/services/4.webp',
    'description':
        "Creative acrylic and decoration solutions that enhance interiors, signage, and displays with elegance, durability, and a modern professional finish.",
    "subcategories": [
      {
        "name": "Interior Designing",
        "image": "assets/images/sub-services/2.5.webp",
        "desc":
            "Complete interior design services for residential and commercial projects, blending modern aesthetics with functionality to create comfortable, elegant, and inspiring spaces.",
        "materials": [
          {"name": "Luxury Vinyl Tiles (LVT)", "ratePerSqFt": 15},
          {"name": "Fabric Wall Panels", "ratePerSqFt": 25},
          {"name": "Premium Decorative Paint", "ratePerSqFt": 18},
        ],
      },
      {
        "name": "Commercial Fit-outs",
        "image": "assets/images/sub-services/2.6.webp",
        "desc":
            "Professional turnkey fit-out solutions for offices, retail stores, and restaurants, designed to deliver functional layouts, stylish interiors, and durable finishes for businesses.",
        "materials": [
          {"name": "Acoustic Ceiling Tiles", "ratePerSqFt": 20},
          {"name": "Modular Glass Partitions", "ratePerSqFt": 35},
          {"name": "Engineered Wood Flooring", "ratePerSqFt": 30},
        ],
      },
      {
        "name": "Custom Carpentry",
        "image": "assets/images/sub-services/2.7.webp",
        "desc":
            "Tailor-made carpentry works including wardrobes, shelving, cabinets, and wooden décor crafted with precision, offering both practicality and premium aesthetics for interiors.",
        "materials": [
          {"name": "Solid Wood Cabinets", "ratePerSqFt": 45},
          {"name": "Laminate Finish Wardrobes", "ratePerSqFt": 28},
          {"name": "Custom MDF Furniture", "ratePerSqFt": 22},
        ],
      },
      {
        "name": "False Ceiling & Light Partitions",
        "image": "assets/images/sub-services/2.8.webp",
        "desc":
            "Modern false ceilings and gypsum light partitions designed for stylish interiors, enhancing ambiance, acoustic comfort, and lighting for residential and commercial environments.",
        "materials": [
          {"name": "Gypsum Board Ceiling", "ratePerSqFt": 15},
          {"name": "POP Decorative Ceiling", "ratePerSqFt": 18},
          {"name": "Acoustic Gypsum Panels", "ratePerSqFt": 22},
        ],
      },
      {
        "name": "Wood Flooring Works",
        "image": "assets/images/sub-services/2.9.webp",
        "desc":
            "Premium wood and laminate flooring services that enhance spaces with warmth and natural elegance, offering long-lasting durability for both modern and classic interiors.",
        "materials": [
          {"name": "Engineered Wood Flooring", "ratePerSqFt": 35},
          {"name": "HDF Laminate Flooring", "ratePerSqFt": 20},
          {"name": "Solid Hardwood Flooring", "ratePerSqFt": 50},
        ],
      },
      {
        "name": "Wallpapers and Paints",
        "image": "assets/images/sub-services/5.4.webp",
        "desc":
            "Transform your walls with premium wallpapers and paints in vibrant colors and unique textures. Ideal for creating stylish interiors that reflect personality and elegance in any space.",
        "materials": [
          {"name": "Matte Finish Digital Wallpaper", "ratePerSqFt": 12},
          {"name": "Textured Vinyl Wallpaper", "ratePerSqFt": 15},
          {"name": "Eco-Solvent Printed Wallpaper", "ratePerSqFt": 18},
        ],
      },
      {
        "name": "Wall Art",
        "image": "assets/images/sub-services/5.3.webp",
        "desc":
            "Creative wall art options including canvas, acrylic, and framed prints, crafted to add character, sophistication, and a striking visual appeal to residential and commercial spaces.",
        "materials": [
          {"name": "Canvas Art Prints", "ratePerSqFt": 18},
          {"name": "Acrylic Glass Panels", "ratePerSqFt": 25},
          {"name": "Framed Premium Posters", "ratePerSqFt": 20},
        ],
      },
    ],
  },
  {
    "name": "Digital Printing",
    "image": "assets/images/services/2.webp",
    "description":
        "Offering complete digital and printing solutions, including design, branding, marketing materials, and high-quality prints to meet all business needs.",
    "subcategories": [
      {
        "name": "Indoor / Outdoor Digital Printing",
        "image": "assets/images/sub-services/3.1.webp",
        "desc":
            "Premium indoor and outdoor digital printing solutions for posters, banners, and signage. Durable, high-resolution prints with vibrant colors for marketing and branding needs.",
        "materials": [
          {"name": "Standard Photo Paper 200gsm", "ratePerSqFt": 5},
          {"name": "Canvas Print (Matte)", "ratePerSqFt": 10},
          {"name": "Gloss Photo Paper 250gsm", "ratePerSqFt": 7},
        ],
      },
      {
        "name": "Vehicle Graphics",
        "image": "assets/images/sub-services/3.5.webp",
        "desc":
            "Custom vehicle graphics and wraps for branding and advertising. UV-resistant, durable prints with vibrant colors to make your cars, vans, and fleets stand out on the road.",
        "materials": [
          {"name": "Vinyl Vehicle Sticker (Standard)", "ratePerSqFt": 10},
          {"name": "Reflective Vehicle Graphics", "ratePerSqFt": 15},
          {"name": "Perforated Window Film", "ratePerSqFt": 12},
        ],
      },
      {
        "name": "UV Printing",
        "image": "assets/images/sub-services/3.3.webp",
        "desc":
            "Advanced UV printing technology for acrylic, metal, and foam boards. Offers sharp, fade-resistant prints with direct-to-surface durability and a premium finish.",
        "materials": [
          {"name": "Acrylic UV Print", "ratePerSqFt": 20},
          {"name": "Foam Board UV Print", "ratePerSqFt": 15},
          {"name": "Metal Sheet UV Print", "ratePerSqFt": 25},
        ],
      },
      {
        "name": "Digital Fabric Printing",
        "image": "assets/images/sub-services/3.4.webp",
        "desc":
            "High-quality fabric printing for flags, soft signage, and displays. Durable, vibrant, and washable prints designed for exhibitions, retail branding, and promotional use.",
        "materials": [
          {"name": "Polyester Fabric Print", "ratePerSqFt": 12},
          {"name": "Satin Fabric Print", "ratePerSqFt": 15},
          {"name": "Backlit Fabric Print", "ratePerSqFt": 18},
        ],
      },
    ],
  },
  {
    "name": "Billboard & Signage",
    "image": "assets/images/services/3.webp",
    "description":
        "We provide complete board solutions, including design, printing, fabrication, and installation of display boards, branding boards, and custom creations.",
    "subcategories": [
      {
        "name": "Outdoor Signs",
        "image": "assets/images/sub-services/4.6.webp",
        "desc":
            "Durable and weather-resistant outdoor signage designed to boost visibility. Ideal for shopfronts, building facades, and high-traffic areas with lasting impact.",
        "materials": [
          {"name": "Aluminum Composite Panel (ACP)", "ratePerSqFt": 18},
          {"name": "Weatherproof PVC Board", "ratePerSqFt": 12},
          {"name": "LED Channel Letters", "ratePerLetter": 40},
        ],
      },
      {
        "name": "Indoor Signs",
        "image": "assets/images/sub-services/bs-2.webp",
        "desc":
            "Custom indoor signage for offices, retail stores, and events. Delivers a clean, professional look to guide, inform, and enhance branding within interior spaces.",
        "materials": [
          {"name": "Acrylic Sheet Sign", "ratePerSqFt": 20},
          {"name": "Foam Board Sign", "ratePerSqFt": 8},
          {"name": "Vinyl Cut Lettering", "ratePerSqFt": 10},
        ],
      },
      {
        "name": "Safety Signs",
        "image": "assets/images/sub-services/4.3.webp",
        "desc":
            "Regulation-compliant safety signage for workplaces, factories, and public spaces. Clear visuals ensure safety awareness and compliance with standards.",
        "materials": [
          {"name": "Reflective Safety Sign Board", "ratePerSqFt": 18},
          {"name": "Glow-in-the-Dark Safety Sign", "ratePerSqFt": 22},
          {"name": "Acrylic Safety Sign Plate", "ratePerSqFt": 15},
        ],
      },
      {
        "name": "Billboards",
        "image": "assets/images/sub-services/bs-3.webp",
        "desc":
            "High-visibility billboard solutions for impactful outdoor advertising. Perfect for highways, rooftops, and cityscapes with large-scale brand exposure.",
        "materials": [
          {"name": "Flex Billboard", "ratePerSqFt": 12},
          {"name": "Vinyl Billboard Print", "ratePerSqFt": 14},
          {"name": "3D / Custom Structure Billboard", "ratePerSqFt": 25},
        ],
      },
      {
        "name": "Acrylic Scooter Boards",
        "image": "assets/images/sub-services/2.1.webp",
        "desc":
            "Durable and stylish acrylic scooter boards designed for custom branding and advertising. Available in clear, colored, or mirror finishes for eye-catching displays.",
        "materials": [
          {"name": "Clear Cast Acrylic Sheet 5mm", "ratePerSqFt": 20},
          {"name": "Colored / Tinted Acrylic 5mm", "ratePerSqFt": 25},
          {"name": "Mirror Finish Acrylic 5mm", "ratePerSqFt": 30},
        ],
      },
      {
        "name": "Acrylic Signs",
        "image": "assets/images/sub-services/bs-5.webp",
        "desc":
            "Premium acrylic sign boards ideal for indoor and outdoor branding. Long-lasting, weather-resistant, and available in glossy, frosted, or backlit styles for modern signage.",
        "materials": [
          {"name": "Glossy Acrylic Sign Board", "ratePerSqFt": 22},
          {"name": "Frosted Acrylic Sign Board", "ratePerSqFt": 25},
          {"name": "Backlit Acrylic Sign Board", "ratePerSqFt": 28},
        ],
      },
    ],
  },
  {
    "name": "Digital Solutions",
    "image": "assets/images/services/5.webp",
    "description":
        "Advertising & Marketing services driving brand growth through creative campaigns, digital strategy, and targeted outreach to engage and convert audiences",
    "subcategories": [
      {
        "name": "Web Development",
        "image": "assets/images/sub-services/ds-1.webp",
        "desc":
            "Custom websites designed for performance, responsiveness, and SEO. From corporate sites to e-commerce platforms, built to enhance your online presence.",
      },
      {
        "name": "Digital Marketing",
        "image": "assets/images/sub-services/ds-2.webp",
        "desc":
            "Comprehensive digital marketing solutions including SEO, PPC, email campaigns, and online ads to maximize reach, drive traffic, and boost conversions.",
      },
      {
        "name": "Social Media Handling",
        "image": "assets/images/sub-services/ds-3.webp",
        "desc":
            "End-to-end social media management for platforms like Instagram, Facebook, and LinkedIn. Content creation, posting, and engagement to grow your brand online.",
      },
      {
        "name": "Mobile App Development",
        "image": "assets/images/sub-services/6.4.webp",
        "desc":
            "Innovative mobile app solutions for iOS and Android. Scalable, user-friendly apps tailored to your business needs with modern design and smooth performance.",
      },
    ],
  },
];

final List<Map<String, dynamic>> rawCategoriesAr = [
  {
    'name': "خدمات تغليف السيارات",
    'image': 'assets/images/services/1.webp',
    'description':
        "حوّل سيارتك مع حلول التغليف الاحترافية — من تغليف العلامات التجارية الجذابة إلى تغييرات الألوان الأنيقة وتغليف الأسطول بالكامل. نستخدم أفضل أنواع الفينيل لنتائج طويلة الأمد.",
    'subcategories': [
      {
        'name': "تغليف سيارات العلامات التجارية",
        'image': 'assets/images/sub-services/1.1.webp',
        'desc':
            "روّج لعلامتك التجارية بتغليف سيارات مصمم بدقة. يوفر فينيلنا المتين صورًا جريئة وتشطيبًا مثاليًا، مما يجعل كل رحلة فرصة تسويقية.",
        'materials': [
          {'name': "فيلم فينيل لامع (3M / Avery / Oracal)", 'ratePerSqFt': 10},
          {'name': "فيلم فينيل مطفي", 'ratePerSqFt': 12},
          {'name': "فيلم فينيل متغير اللون / كروم", 'ratePerSqFt': 18},
          {
            'name': "فيلم فينيل مصبوب (عالي الجودة وطويل الأمد)",
            'ratePerSqFt': 15,
          },
        ],
      },
      {
        'name': "تغيير اللون",
        'image': 'assets/images/sub-services/1.2.webp',
        'desc':
            "جدد مظهر سيارتك مع تغيير اللون الكامل. اختر من بين التغليف اللامع، المطفي، أو المعدني لتعزيز الجماليات وحماية طلاء المصنع.",
        'materials': [
          {'name': "تغليف بتشطيب لامع", 'ratePerSqFt': 11},
          {'name': "تغليف بتشطيب مطفي", 'ratePerSqFt': 13},
          {'name': "تغليف ساتان معدني", 'ratePerSqFt': 16},
          {'name': "تغليف كروم / متغير اللون", 'ratePerSqFt': 20},
        ],
      },
      {
        'name': "تغليف أسطول المركبات",
        'image': 'assets/images/sub-services/1.7.webp',
        'desc':
            "ضمان العلامة التجارية المتسقة والمحترفة لجميع مركبات الشركة. رسومات الفينيل الكبيرة مقاومة للأشعة فوق البنفسجية ومصممة لديمومة ووضوح طويل الأمد.",
        'materials': [
          {
            'name': "فيلم فينيل قابل للطباعة (للاستخدام التجاري)",
            'ratePerSqFt': 9,
          },
          {'name': "فيلم فينيل مُغلف", 'ratePerSqFt': 11},
          {'name': "فينيل مصبوب عالي المتانة", 'ratePerSqFt': 14},
          {'name': "فينيل عاكس (للأمان / الرؤية)", 'ratePerSqFt': 17},
        ],
      },
      {
        'name': "دهانات قابلة للإزالة",
        'image': 'assets/images/sub-services/1.5.webp',
        'desc':
            "تجربة تخصيص ألوان مؤقتة ودائمة مع الدهانات القابلة للإزالة. متوفرة بتشطيبات لامعة، مطفية، أو كروم — يمكن إزالتها بسهولة دون الإضرار بطلاء السيارة الأصلي.",
        'materials': [
          {'name': "دهان بتشطيب لامع قابل للإزالة", 'ratePerSqFt': 18},
          {'name': "دهان بتشطيب مطفي قابل للإزالة", 'ratePerSqFt': 20},
          {'name': "دهان كروم / تأثير خاص قابل للإزالة", 'ratePerSqFt': 35},
        ],
      },
      {
        'name': "موافقات واجتياز هيئة الطرق والمواصلات",
        'image': 'assets/images/sub-services/1.6.webp',
        'desc':
            "احصل على الدعم الكامل لموافقة واجتياز هيئة الطرق والمواصلات بعد التعديلات أو تغييرات اللون. نتولى الوثائق والامتثال لضمان عملية سلسة وخالية من المتاعب.",
        'materials': [
          {'name': "موافقة تغيير اللون", 'rate': 400},
          {'name': "دعم كامل لاجتياز الفحص والتسجيل", 'rate': 600},
        ],
      },
    ],
  },
  {
    'name': "تظليل وحماية السيارات",
    'image': 'assets/images/services/6.webp',
    'description':
        "عزّز الراحة وحافظ على مظهر سيارتك مع حلول التظليل والحماية المميزة — من أفلام النوافذ المقاومة للحرارة إلى حماية الطلاء والطلاءات السيراميكية.",
    'subcategories': [
      {
        'name': "تظليل النوافذ",
        'image': 'assets/images/sub-services/6.1.webp',
        'desc':
            "حسّن راحة المقصورة، قلّل الوهج، واحجب الأشعة فوق البنفسجية الضارة باستخدام أفلام النوافذ عالية الأداء. اختر من بين الخيارات القياسية أو السيراميكية أو النانو-سيراميكية للحصول على الظل المثالي.",
        'materials': [
          {'name': "فيلم مصبوغ قياسي", 'ratePerSqFt': 5},
          {'name': "فيلم تظليل كربوني", 'ratePerSqFt': 8},
          {'name': "فيلم تظليل سيراميكي", 'ratePerSqFt': 12},
          {'name': "فيلم نانو-سيراميكي لرفض الحرارة", 'ratePerSqFt': 15},
        ],
      },
      {
        'name': "فيلم حماية الطلاء (PPF)",
        'image': 'assets/images/sub-services/6.2.webp',
        'desc':
            "احمِ طلاء سيارتك من الخدوش والتشققات وأضرار الطقس باستخدام فيلم حماية طلاء شفاف. مصمم للمتانة والوضوح، ليحافظ على مظهر سيارتك الجديد لسنوات.",
        'materials': [
          {'name': "PPF لامع (قياسي)", 'ratePerSqFt': 18},
          {'name': "PPF مطفي (تشطيب ساتان)", 'ratePerSqFt': 20},
          {'name': "PPF ذاتي الشفاء", 'ratePerSqFt': 25},
          {'name': "PPF مطلي بالسيراميك", 'ratePerSqFt': 28},
        ],
      },
      {
        'name': "التغطية السيراميكية",
        'image': 'assets/images/sub-services/6.3.webp',
        'desc':
            "أضف لمعانًا وحماية طويلة الأمد مع الطلاء النانو-سيراميكي. يصد الأوساخ، يعزز اللمعان، ويكوّن حاجزًا قويًا ضد الأشعة فوق البنفسجية، الأكسدة، والملوثات البيئية.",
        'materials': [
          {'name': "طلاء سيراميكي لمدة سنة", 'ratePerSqFt': 10},
          {'name': "طلاء سيراميكي لمدة ثلاث سنوات", 'ratePerSqFt': 14},
          {'name': "طلاء سيراميكي لمدة خمس سنوات", 'ratePerSqFt': 18},
          {'name': "طلاء سيراميكي بالغرافين", 'ratePerSqFt': 22},
        ],
      },
    ],
  },
  {
    'name': "تشطيبات داخلية",
    'image': 'assets/images/services/4.webp',
    'description':
        "حلول مبتكرة من الأكريليك والديكور لتعزيز المساحات الداخلية، اللافتات، والعروض بأسلوب أنيق ودائم وتشطيب احترافي عصري.",
    "subcategories": [
      {
        "name": "تصميم داخلي",
        "image": "assets/images/sub-services/2.5.webp",
        "desc":
            "خدمات تصميم داخلي كاملة للمشاريع السكنية والتجارية، تجمع بين الجمالية العصرية والوظيفية لخلق مساحات مريحة وأنيقة وملهمة.",
        "materials": [
          {"name": "بلاط فينيل فاخر (LVT)", "ratePerSqFt": 15},
          {"name": "ألواح حائط قماشية", "ratePerSqFt": 25},
          {"name": "دهان زخرفي فاخر", "ratePerSqFt": 18},
        ],
      },
      {
        "name": "تشطيبات تجارية",
        "image": "assets/images/sub-services/2.6.webp",
        "desc":
            "حلول متكاملة لتشطيبات المكاتب، المحلات، والمطاعم، مصممة لتوفير تخطيطات عملية وديكورات أنيقة وتشطيبات متينة للشركات.",
        "materials": [
          {"name": "ألواح سقف عازلة للصوت", "ratePerSqFt": 20},
          {"name": "قسيمات زجاجية معيارية", "ratePerSqFt": 35},
          {"name": "أرضيات خشبية هندسية", "ratePerSqFt": 30},
        ],
      },
      {
        "name": "نجارة مخصصة",
        "image": "assets/images/sub-services/2.7.webp",
        "desc":
            "أعمال نجارة مصممة حسب الطلب تشمل الخزائن، الرفوف، الدواليب، والديكورات الخشبية بدقة عالية، مقدمة مزيجًا من العملية والجمالية الفاخرة.",
        "materials": [
          {"name": "خزائن خشبية صلبة", "ratePerSqFt": 45},
          {"name": "دواليب بتشطيب لامينيت", "ratePerSqFt": 28},
          {"name": "أثاث MDF مخصص", "ratePerSqFt": 22},
        ],
      },
      {
        "name": "أسقف معلقة وقواطع خفيفة",
        "image": "assets/images/sub-services/2.8.webp",
        "desc":
            "أسقف معلقة عصرية وقواطع جبسية خفيفة مصممة لمساحات داخلية أنيقة، تعزز الأجواء، الراحة الصوتية، والإضاءة للمنازل والمشاريع التجارية.",
        "materials": [
          {"name": "سقف من ألواح الجبس", "ratePerSqFt": 15},
          {"name": "سقف زخرفي POP", "ratePerSqFt": 18},
          {"name": "ألواح جبسية عازلة للصوت", "ratePerSqFt": 22},
        ],
      },
      {
        "name": "أعمال أرضيات خشبية",
        "image": "assets/images/sub-services/2.9.webp",
        "desc":
            "خدمات أرضيات خشبية ولم laminate عالية الجودة تضيف دفئًا وأناقة طبيعية للمساحات، مع متانة طويلة الأمد للمساحات العصرية والكلاسيكية.",
        "materials": [
          {"name": "أرضيات خشبية هندسية", "ratePerSqFt": 35},
          {"name": "أرضيات لامينيت HDF", "ratePerSqFt": 20},
          {"name": "أرضيات خشب صلب", "ratePerSqFt": 50},
        ],
      },
      {
        "name": "ورق جدران ودهانات",
        "image": "assets/images/sub-services/5.4.webp",
        "desc":
            "حوّل جدرانك بورق جدران ودهانات فاخرة بألوان زاهية وقوام فريد. مثالي لخلق ديكورات عصرية تعكس الشخصية والأناقة في أي مساحة.",
        "materials": [
          {"name": "ورق جدران رقمي بتشطيب مطفي", "ratePerSqFt": 12},
          {"name": "ورق جدران فينيل بنمط", "ratePerSqFt": 15},
          {"name": "ورق جدران مطبوع Eco-Solvent", "ratePerSqFt": 18},
        ],
      },
      {
        "name": "فن الجدران",
        "image": "assets/images/sub-services/5.3.webp",
        "desc":
            "خيارات فنية للجدران بما في ذلك الطباعة على القماش، الأكرليك، والإطارات المميزة، صممت لإضافة شخصية ورقي وجاذبية بصرية للمساحات السكنية والتجارية.",
        "materials": [
          {"name": "طباعة فنية على القماش", "ratePerSqFt": 18},
          {"name": "ألواح أكريليك زجاجية", "ratePerSqFt": 25},
          {"name": "ملصقات فاخرة مؤطرة", "ratePerSqFt": 20},
        ],
      },
    ],
  },
  {
    "name": "الطباعة الرقمية",
    "image": "assets/images/services/2.webp",
    "description":
        "تقديم حلول كاملة للطباعة الرقمية، بما في ذلك التصميم، العلامة التجارية، المواد التسويقية، والطباعة عالية الجودة لتلبية جميع احتياجات الأعمال.",
    "subcategories": [
      {
        "name": "الطباعة الرقمية الداخلية / الخارجية",
        "image": "assets/images/sub-services/3.1.webp",
        "desc":
            "حلول طباعة رقمية داخلية وخارجية عالية الجودة للملصقات، البانرات، واللافتات. طباعة متينة وعالية الدقة بألوان زاهية لتلبية احتياجات التسويق والعلامة التجارية.",
        "materials": [
          {"name": "ورق تصوير قياسي 200gsm", "ratePerSqFt": 5},
          {"name": "طباعة قماشية (مطفي)", "ratePerSqFt": 10},
          {"name": "ورق تصوير لامع 250gsm", "ratePerSqFt": 7},
        ],
      },
      {
        "name": "رسومات المركبات",
        "image": "assets/images/sub-services/3.5.webp",
        "desc":
            "رسومات وتغليف مخصص للمركبات لغرض العلامة التجارية والإعلانات. طباعة مقاومة للأشعة فوق البنفسجية، متينة وذات ألوان زاهية لجعل سياراتك، شاحناتك، وأساطيلك تبرز على الطريق.",
        "materials": [
          {"name": "ملصق فينيل للمركبة (قياسي)", "ratePerSqFt": 10},
          {"name": "رسومات عاكسة للمركبة", "ratePerSqFt": 15},
          {"name": "فيلم نافذة مثقوب", "ratePerSqFt": 12},
        ],
      },
      {
        "name": "الطباعة بالأشعة فوق البنفسجية (UV)",
        "image": "assets/images/sub-services/3.3.webp",
        "desc":
            "تكنولوجيا الطباعة بالأشعة فوق البنفسجية المتقدمة للأكريليك، المعدن، ولوحات الفوم. تقدم طباعات دقيقة مقاومة للتلاشي مع متانة عالية وتشطيب فاخر.",
        "materials": [
          {"name": "طباعة أكريليك بالأشعة فوق البنفسجية", "ratePerSqFt": 20},
          {"name": "طباعة لوحة فوم بالأشعة فوق البنفسجية", "ratePerSqFt": 15},
          {
            "name": "طباعة ورقة معدنية بالأشعة فوق البنفسجية",
            "ratePerSqFt": 25,
          },
        ],
      },
      {
        "name": "الطباعة على الأقمشة الرقمية",
        "image": "assets/images/sub-services/3.4.webp",
        "desc":
            "طباعة عالية الجودة على الأقمشة للأعلام، اللافتات الناعمة، والعروض. طباعات متينة، زاهية، وقابلة للغسل مصممة للمعارض، العلامة التجارية للتجزئة، والاستخدام الترويجي.",
        "materials": [
          {"name": "طباعة قماش بوليستر", "ratePerSqFt": 12},
          {"name": "طباعة قماش ساتان", "ratePerSqFt": 15},
          {"name": "طباعة قماش مضاءة من الخلف", "ratePerSqFt": 18},
        ],
      },
    ],
  },
  {
    "name": "اللوحات والإشارات",
    "image": "assets/images/services/3.webp",
    "description":
        "نحن نوفر حلولًا متكاملة للّوحات تشمل التصميم والطباعة والتصنيع والتركيب للّوحات الإعلانية والعلامات التجارية والابتكارات المخصصة.",
    "subcategories": [
      {
        "name": "اللوحات الخارجية",
        "image": "assets/images/sub-services/4.6.webp",
        "desc":
            "لافتات خارجية متينة ومقاومة للعوامل الجوية مصممة لتعزيز الظهور. مثالية لواجهات المتاجر والمباني والمناطق ذات الحركة العالية لتأثير يدوم طويلًا.",
        "materials": [
          {"name": "ألواح الألمنيوم المركبة (ACP)", "ratePerSqFt": 18},
          {"name": "لوح PVC مقاوم للعوامل الجوية", "ratePerSqFt": 12},
          {"name": "حروف مضيئة LED", "ratePerLetter": 40},
        ],
      },
      {
        "name": "اللوحات الداخلية",
        "image": "assets/images/sub-services/bs-2.webp",
        "desc":
            "لافتات داخلية مخصصة للمكاتب والمتاجر والمناسبات، تمنح مظهرًا احترافيًا أنيقًا لتوجيه العملاء وتعزيز الهوية البصرية داخل المساحات الداخلية.",
        "materials": [
          {"name": "لافتة أكريليك", "ratePerSqFt": 20},
          {"name": "لافتة من لوح الفوم", "ratePerSqFt": 8},
          {"name": "حروف مقطعة من الفينيل", "ratePerSqFt": 10},
        ],
      },
      {
        "name": "لوحات السلامة",
        "image": "assets/images/sub-services/4.3.webp",
        "desc":
            "لوحات سلامة مطابقة للمعايير للمصانع وأماكن العمل والأماكن العامة، بتصميمات واضحة تضمن الوعي بالسلامة والامتثال للأنظمة.",
        "materials": [
          {"name": "لوحة سلامة عاكسة", "ratePerSqFt": 18},
          {"name": "لوحة سلامة مضيئة في الظلام", "ratePerSqFt": 22},
          {"name": "لوحة سلامة أكريليك", "ratePerSqFt": 15},
        ],
      },
      {
        "name": "اللوحات الإعلانية",
        "image": "assets/images/sub-services/bs-3.webp",
        "desc":
            "حلول لوحات إعلانية عالية الوضوح لإعلانات خارجية مؤثرة. مثالية للطرق السريعة والأسطح والمدن لتوفير انتشار واسع للعلامة التجارية.",
        "materials": [
          {"name": "لوحة فليكس", "ratePerSqFt": 12},
          {"name": "طباعة لوحة فينيل", "ratePerSqFt": 14},
          {"name": "لوحة ثلاثية الأبعاد / مخصصة", "ratePerSqFt": 25},
        ],
      },
      {
        "name": "لوحات الأكريليك المتنقلة",
        "image": "assets/images/sub-services/2.1.webp",
        "desc":
            "ألواح أكريليك متينة وأنيقة مصممة للإعلانات والعلامات التجارية المخصصة. متوفرة بخامات شفافة أو ملونة أو عاكسة لتصميمات جذابة.",
        "materials": [
          {"name": "لوح أكريليك شفاف 5 ملم", "ratePerSqFt": 20},
          {"name": "لوح أكريليك ملون / مظلل 5 ملم", "ratePerSqFt": 25},
          {"name": "لوح أكريليك بلمسة مرآة 5 ملم", "ratePerSqFt": 30},
        ],
      },
      {
        "name": "لوحات الأكريليك",
        "image": "assets/images/sub-services/bs-5.webp",
        "desc":
            "لوحات أكريليك فاخرة مثالية للإعلانات الداخلية والخارجية. مقاومة للعوامل الجوية ومتوفرة بتشطيبات لامعة أو مضببة أو مضيئة من الخلف بتصميم عصري.",
        "materials": [
          {"name": "لوحة أكريليك لامعة", "ratePerSqFt": 22},
          {"name": "لوحة أكريليك مضببة", "ratePerSqFt": 25},
          {"name": "لوحة أكريليك مضيئة من الخلف", "ratePerSqFt": 28},
        ],
      },
    ],
  },
  {
    "name": "الحلول الرقمية",
    "image": "assets/images/services/5.webp",
    "description":
        "خدمات الإعلان والتسويق التي تدفع نمو العلامة التجارية من خلال الحملات الإبداعية، الاستراتيجية الرقمية، والتواصل المستهدف لجذب وتحويل الجمهور.",
    "subcategories": [
      {
        "name": "تطوير المواقع",
        "image": "assets/images/sub-services/ds-1.webp",
        "desc":
            "مواقع إلكترونية مخصصة مصممة للأداء العالي، التوافق مع الأجهزة المختلفة، وتحسين محركات البحث. من المواقع المؤسسية إلى منصات التجارة الإلكترونية، تُبنى لتعزيز حضورك على الإنترنت.",
      },
      {
        "name": "التسويق الرقمي",
        "image": "assets/images/sub-services/ds-2.webp",
        "desc":
            "حلول تسويق رقمي شاملة تشمل تحسين محركات البحث (SEO)، الدفع مقابل النقر (PPC)، حملات البريد الإلكتروني، والإعلانات عبر الإنترنت لتعظيم الوصول، وزيادة الحركة، وتعزيز التحويلات.",
      },
      {
        "name": "إدارة وسائل التواصل الاجتماعي",
        "image": "assets/images/sub-services/ds-3.webp",
        "desc":
            "إدارة شاملة لوسائل التواصل الاجتماعي على منصات مثل إنستغرام، فيسبوك، ولينكدإن. إنشاء المحتوى، النشر، والتفاعل لنمو علامتك التجارية عبر الإنترنت.",
      },
      {
        "name": "تطوير تطبيقات الهواتف",
        "image": "assets/images/sub-services/6.4.webp",
        "desc":
            "حلول مبتكرة لتطبيقات الهواتف لأجهزة iOS وAndroid. تطبيقات قابلة للتوسع وسهلة الاستخدام مصممة لتلبية احتياجات عملك مع تصميم عصري وأداء سلس.",
      },
    ],
  },
];

List<ServiceModel> getServicesList(String languageCode) {
  final rawCategories = languageCode == 'ar'
      ? rawCategoriesAr
      : rawCategoriesEn;
  return rawCategories.map((json) => ServiceModel.fromJson(json)).toList();
}

List<SubServiceModel> getAllSubServices(String languageCode) {
  final servicesList = getServicesList(languageCode);
  return servicesList
      .expand<SubServiceModel>((category) => category.subcategories ?? [])
      .toList();
}

List<SubServiceModel> getPopularServices(String languageCode, {int count = 2}) {
  final servicesList = getServicesList(languageCode);
  return servicesList
      .expand<SubServiceModel>(
        (category) => (category.subcategories ?? []).take(count),
      )
      .toList();
}
