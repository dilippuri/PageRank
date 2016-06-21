*********************************************
Project Proposal
*********************************************

*********************************************
Problem Defination -
*********************************************
	Given a few number of interlinked web pages, we need to sort the pages according to
relevance with a given query. The whole idea is to create a mini search engine based on Google’s
Page Rank Algorithm in this project.
*********************************************

*********************************************
Deliverable(s)
*********************************************
The project would broadly involve five steps:
	• Making and Storing web Pages
	• Searching (Search Engine)
	• Adjacency Matrix formation
	• Rank Calculation(Eigen Analysis)
	• Sorting of web pages and showing the results.
*********************************************

*********************************************
Input(s)
	- Webpages (HTML) which contains links of another pages.
	- Query related to those pages

Output(s)
	- List of relevent pages according to their reletivity of given query.
*********************************************

*********************************************
Basic Philosophy:
*********************************************

Just like a research paper is more important because it has lots of citations, a
web page is also more important if lots of other web pages refer to it i.e. has
outlink to the page. The importance of a scholarly article is more if it has ci-
tation from other important articles similarly a page with outlinks from other
important pages has higher important than those which does not. Further we
say that if a page has n outlinks, it distributes all of its’ importance equally to
all the pages it is referring to. So it is like a democritic system in which pages
are voting for other pages by giving equal part of their vote to all pages which
are being referred by it. The value of vote describe importance of a page.
*********************************************

*********************************************
Implementation:
*********************************************
In this section we will discuss about the implementation procedure that we
followed in environment we worked.
	• For implementation of PageRank we are using LAMP and GNU Octave.
	• We are storing pages, related keywords and corresponding outlinks.
	• It will take keywords from query and find related pages then fetch pageid and outlinks.
	• Then it will make adjacency matrix.
	• Using this adjacent matrix create new link matrix.
	• Check for dangling nodes then handle those nodes by using PageRank formula which is given above.
	• Then it will find eigenvector correspoing to dominant eigenvalues.
	• According to eigenvector it calculate rank vector.
	• Show pages accordingly.
*********************************************

*********************************************
Contribution:
*********************************************
The following table gives the details of contribution of each member:

|Members’ Name | ID | Contribution |
|----------|--------|--------------|
| Dilip Puri | 201351014 | Implementation(coding) and Presentation |
| Abhijeet Singh | 201351005 | Implementation |
| Chirag Panpalia | 201351001 | Problem study and algorithm development for implementation |
| Sonu Patidar | 201351016 | Problem study and algorithm development for implementation, report preparation |

