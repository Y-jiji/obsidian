---
tags:
  - 𝔉-resume
---
# Problem Statement (Prior Work)

Describe a project or research you worked on in a class, capstone, lab, work, etc. that was   
meaningful to you. 
Your answer should include :
- A brief, high-level description of the work
- Significance of the work
- Appropriate details on your approach  
- Results or outcomes achieved  
In addition, describe one or two specific projects or problems of interest to you for your   
future PhD thesis work. Explain how and why you might approach these problems. In your   
response, use language appropriate to someone in your field without specific expertise in your   
project, such as a fellow student or a work colleague.

I would like to describe the first database research project that I worked on. During my undergraduate studies, I participated in the Spectrum project, dedicated to building a concurrent protocol for the blockchain execution stage. Unlike traditional database systems, blockchains have two additional unique requirements. The serialization order of transactions is pre-determined, which means that for the same block of transactions, they must produce the same result if starting from the same state. Additionally, the transaction workload is longer than in traditional systems, meaning naive optimistic parallelism suffers from costly re-executions. We built on the state-of-the-art 'Sparkle' protocol to address these challenges. A senior PhD student introduced the concept of partial rollback, meaning that a transaction can redo from the point of contention. However, to implement this effectively, we needed to journal all intermediate states. I developed a data structure by integrating a copy-on-write mechanism into the execution state. With this data structure, we achieved $O(1)$ time rollback and $O("instructions")$ space for storing intermediate states, and our scheme delivered a seven-fold performance improvement over the original Sparkle scheme. In this project, I practiced previously forged algorithm design and analysis techniques, and the ability to modify complicated system software. 

After coming to Georgia Tech, I started working with Dr. Jun Xu and his PhD students. I participated in the PLOW project on error correction codes. In this project, we aimed to develop an encoding scheme suitable for real-time streaming and to establish a theoretical framework providing lower bounds on failure rates. Before I joined the project, we already had schemes that performed well empirically in terms of decoding latency and low extra payload. The main challenge was on the theoretical side. In related work in this field, the analysis frameworks are typically constructed to analyze the probability of successfully transmitting all the original data. However, losing one or two frames does not matter in our particular use case. I developed an iterative, stronger decoding semantics that is both easy to analyze and does not deviate significantly from the real scheme after several iterations. Using this iterative semantics, we derived a fairly tight lower bound on packet loss for the original message. Through this project, I developed skills in analyzing and designing randomized algorithms. 

Alongside this project, I also explored other projects in database systems. Currently, I am working on an indexing project for bilinear form search, where the goal is to find the pair $(x, y)$ from a database that minimizes or maximizes $x^T A y$, given the query matrix $A$. We found that indexing time can be reduced using the exchange property of Kronecker products and matrix traces. In this project, I learned that simple algorithmic techniques can also yield good results. 

Looking ahead, my PhD research will focus on indexing for vector databases. Despite recent breakthroughs, indexes for nearest neighbor search do not effectively support searches with additional conditions or modifications. In the future, I plan to work on these challenges using the algorithmic and system optimization techniques that I developed in previous projects.

# Problem Statement (Prior Experience)

Discuss how your prior experience prepared you for this graduate program. Our goal is to   
understand what uniquely distinguishes your application and your potential success in graduate   
school. 
Your answer should include:  
- Your preparation in professional and leadership skills, teaching experience, mentorship, internships, competition teams, and work experience, including your specific role.  
- If applicable, describe how your academic or professional experience is relevant to the graduate program. Include specific training in research methods, specialized equipment or software, certifications, etc.   
- You may also describe any other non-academic experiences, such as volunteering, you have had that might benefit you as a graduate student.

In Fall 2024 semester, I served as a teaching assistant for CS4400: introduction to databases at Georgia Tech. Apart from normal TA obligations, I worked on the autograder team, where I provided coding questions for tests and built grading automation tools. I implemented several building tools that helps streamline test creation and a randomized test data generator written fully in SQL. These tools will support fair and creative evaluations in the future. Additionally, I volunteered to provide one of the lecture videos for the NoSQL lecture series. The content is about Neo4J graph database. In this experience, I cultivated the ability to communicate complex concepts effectively and work collaboratively with other people. 

Prior to Georgia Tech, I interned at the Chinese academy of science, where I worked on a reinforcement learning platform for lab members to use for benchmarking and comparing their results. Although this not directly linked to my current focus on database systems, I learned how to write organized python with clean abstractions, manage different versions of medium-sized source code using git, setup automated tests using Jenkins, and effectively locate and fix unprecedented bugs using MyPy type checker. 

Outside of academia, I am an active contributor to the Rust programming community through the ouroboros project, which focuses on implementing self-referential data structures with type safety. My primary contribution was adding support for constant generics, which improved the project’s semantic flexibility while preserving its robust type-safety guarantees. Since ouroboros is a popular package in database community (you need it to implement data iterators), I get to know people in database community and keep up with the advancements. This work also enhanced my expertise in advanced programming paradigms, which directly benefits my research in designing efficient data structures for databases. 

With these experiences, I feel more confident for advanced research in database systems. I gained the programming skills in python, c++, and rust, and the experience to understand and navigate existing project source code. I learned how to manage versions and collaborate with team members to build a software collectively, and how to convey knowledge to other students and acquire knowledge from the community. These experiences have not only prepared me academically and professionally but also fueled my passion for contributing to the evolving landscape of database technologies through impactful research and innovation. 

# Problem Statement (Academic Goals)

Describe why this academic program is a good fit for your academic and research goals.   
Discuss courses, research, faculty, programs, and opportunities that interest you. If applicable, list faculty members who you would like to work with.

The Ph.D. program is an excellent platform for my academic and research goals. I want to 

My research interest perfectly aligns with Dr. Xu's research interest. While being an expert in network research, Dr. Xu's core expertise is really about designing practical random algorithms and data structures. I want to apply my algorithm techniques to solve system problems. 

# Problem Statement (Georgia Tech)

We are interested in knowing more about you as a person. Discuss how your interests align   
with Georgia Tech’s vision. Consider including your past activities and accomplishments or your   
future interests and goals that align with the Georgia Tech vision.  

Georgia Tech’s vision is to be “an example of inclusive innovation, a leading technological, research university relentlessly committed to serving the public good, breaking new ground in addressing the biggest local, national, and global challenges of our time, making technology broadly accessible, and developing exceptional leaders from all backgrounds ready to produce novel ideas and create solutions with real impact.”



# Problem Statement (Weakness)

If applicable, explain discrepancies or weaknesses on your record, such as non-traditional computing and/or mathematics background, employment gaps, low grades, letters of recommendation that are not from a recent supervisor, unusual work experience or career paths, and additional challenges you would like the admissions team to know.

# Consolidated Statement

Throughout my academic training, I have cultivated a deep interest in database systems, driven by technical challenges and evolving applications. My passion lies in applying algorithmic techniques and system optimizations to database indexing, especially in the context of vector databases. With extensive experience in research, teaching, and open-source contributions, I want to pursue a PhD in database systems at Georgia Tech, where I can further refine my skills and contribute to advancements in the field.

### Research Experience

The first significant database research project I undertook was the Spectrum project during my undergraduate studies. Spectrum focused on developing a concurrent protocol for the blockchain execution stage, a domain with unique challenges compared to traditional databases. Blockchains require a pre-determined serialization order of transactions and must handle longer transaction workloads, making naive optimistic parallelism prone to costly re-executions. To address these issues, our team built upon the state-of-the-art 'Sparkle' protocol. A senior PhD student proposed the concept of partial rollback, enabling transactions to redo from the point of contention. However, implementing this required journaling all intermediate states. I developed a data structure integrating a copy-on-write mechanism into the execution state, achieving $O(1)$ time rollback and $O("instructions")$ space for storing intermediate states. This innovation improved performance sevenfold compared to the original Sparkle scheme. Through this project, I honed my algorithm design skills, analyzed intricate systems, and modified complex system software.

At Georgia Tech, I joined Dr. Jun Xu’s research group and participated in the PLOW project, which focuses on error correction codes for real-time streaming. Our goal was to develop an encoding scheme that minimized decoding latency and payload size while providing robust theoretical guarantees. Unlike traditional analysis frameworks that focus on complete data transmission, our use case allowed for occasional frame losses. I devised an iterative decoding semantics that closely approximates the real scheme while enabling tight analytical bounds on packet loss. This experience deepened my expertise in designing and analyzing randomized algorithms, equipping me with valuable theoretical tools for future research. Additionally, I am working on an indexing project for bilinear form search, which aims to efficiently find pairs $(x, y)$ from a database that optimize $x^T A y$ for a given query matrix $A$. Leveraging the exchange property of Kronecker products and matrix traces, our team reduced indexing time. This project demonstrated that even straightforward algorithmic techniques can yield significant performance gains, reinforcing my belief in the power of simplicity in design.

Looking ahead, my PhD research will focus on indexing for vector databases. Current indexes for nearest neighbor search fail to effectively support queries with additional conditions or modifications, despite recent breakthroughs. My goal is to address these limitations using the algorithmic and system optimization techniques I have cultivated through my research. I am particularly excited to continue working with Dr. Xu, whose expertise and guidance have profoundly shaped my research trajectory. His work on hash indexing methods, error correction codes, and switching algorithms aligns strongly with my research interests, and I look forward to further collaboration under his mentorship.

### Teaching and Mentorship

My experience as a teaching assistant for CS4400: Introduction to Databases at Georgia Tech has been instrumental in shaping my ability to communicate complex concepts effectively. In addition to traditional TA duties, I volunteered to produce a lecture video for the NoSQL series on the Neo4J graph database, simplifying intricate topics for students. I also contributed to the autograder team, designing coding questions and creating a randomized test data generator fully implemented in SQL. These tools streamlined the grading process, ensuring fairness and fostering deeper engagement among students. This role solidified my commitment to making database systems accessible and understandable for others.

### Broader Contributions and Technical Skills

Prior to Georgia Tech, I interned at the Chinese Academy of Sciences, where I developed a reinforcement learning platform for benchmarking research results. While this project was outside the domain of database systems, it taught me to write organized Python code, manage source code versions with Git, set up automated tests with Jenkins, and debug effectively using tools like MyPy. These skills have proven invaluable in my subsequent projects.

Beyond academia, I actively contribute to the Rust programming community, where I worked on the ouroboros package. This package implements self-referential data structures with type safety, a critical feature for database systems that iterate over on-disk data. My primary contribution was adding support for constant generics, which enhanced the project’s semantic flexibility while maintaining robust type safety. This experience deepened my understanding of advanced programming paradigms and their practical applications in database research.

Through these diverse experiences, I have developed a strong foundation in Python, C++, and Rust, as well as the ability to navigate and contribute to complex codebases. I am adept at managing collaborative software projects, leveraging version control systems, and acquiring new knowledge from the broader technical community.

### Academic Goals

Georgia Tech’s PhD program offers an unparalleled platform to achieve my academic goals of becoming an expert in database indexing. The program’s comprehensive coursework and focus on database system implementation align perfectly with my interests. My prior collaboration with Dr. Xu has confirmed that our research interests are strongly aligned, particularly in hash indexing methods, error correction codes, and switching algorithms. Under his guidance, I aim to explore how these techniques can be applied to database systems, advancing both theory and practice.

### Vision and Alignment with Georgia Tech

Georgia Tech’s emphasis on innovation and accessibility resonates deeply with me. My work as a teaching assistant and my contributions to open-source projects reflect this shared vision. By designing tools that improve the accessibility of database systems and enhancing critical software packages, I have demonstrated my commitment to making technology more inclusive and impactful.

The ouroboros project, in particular, showcases my dedication to bridging theoretical advancements and practical applications. Extending Rust’s borrowing model to support self-referential types has provided a robust foundation for database software, preventing memory leaks and ensuring system reliability. I am proud to have contributed to a tool widely appreciated in the database community, and I look forward to continuing this trajectory at Georgia Tech.

### Career Aspirations

Upon completing my PhD, I aspire to become a researcher in computer science, either as a research scientist in industry or as a faculty member at a university. The database field is rapidly evolving, driven by emerging applications and novel hardware platforms. I am committed to staying at the forefront of these advancements and contributing to the development of next-generation database systems.

By joining Georgia Tech’s PhD program, I will build on my academic and professional experiences to tackle pressing challenges in database research. With a passion for innovation and a commitment to accessibility, I am eager to contribute to the evolving landscape of database technologies, leaving a lasting impact on the field.

