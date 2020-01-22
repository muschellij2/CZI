---
title: Increasing the Impact of Neuroconductor
abstract: |
  Over the past 5 years, Neuroconductor has centralized the packages of medical image analysis in the R community.  As a repository of a wide variety of analyses of diseases such as Alzheimer's disease [@ding2019improved] and multiple sclerosis[@valcarcel2018dual; @sweeney2013automatic; @sweeney2013oasis], image processing and prediction [@tustison2019longitudinal; @shrivastav2018classification; @polzehlmagnetic; @shinohara2014statistical],  image visualization [@maag2018gganatogram; @mowinckel2019visualisation] and state-of-the-art statistical analyses [@vandekar2019robust].  For Neuroconductor to succeed for the next 5 years and beyond, we need to grow its contributor community, and improve the stability, usability, and portability of the platform.
journal: ""
date: "2020-01-22"
bibliography: refs.bib
header-includes:
   - \usepackage[margin=2.5cm]{geometry}
#linenumbers: true
#numbersections: true
output: 
  bookdown::pdf_book:
    base_format: rticles::elsevier_article
    keep_tex: true
    number_sections: yes
    keep_md: true
---

# Brief Description of Neuroconductor

Neuroconductor is a platform for R package submission and repository of released packages.  A user submits a package to Neuroconductor from a GitHub repository  The backend of the platform then runs an initial set of sanity checks, clones the repository to the Neuroconductor GitHub repository, then checks the package on the continuous integration Travis CI (for Linux/OSX) and Appveyor (Windows).  Any failures in this package checks will be reported back to the author (maintainer) of the package about what failed and what changes need to be made.  As all code is on GitHub, the Neuroconductor team will also send pull requests to fix the code in many cases.  The built packages are then combined every few months as a release/snapshot of all the passing packages at that time.

# Goals





The main objectives of this proposal are:

1. improve the stability and usability of the current (N=98) packages in Neuroconductor.
2. increase the number of packages and community of Neuroconductor's contributors and developers by reaching out to seasoned users and helping them get involved more closely in the project.
3. refactor the core architecture of the Neuroconductor backend platform to handle more packages and incorporate user workflows.  

Our goals will be reached if:

1. Each package has a vignette (a tutorial/long-form documentation) and all packages have a code coverage above 50% (currently 45% meet this criteria).
2. We add at least 10 new packages over the course of the project and get contributions from 20 existing contributors (out of 26).  Contributions will be defined as releasing updates to packages through developers GitHub repositories or submitting additional packages to the collection. 
3. Scale the Neuroconductor framework to 200 packages (currently has 98) and be able to achieve monthly releases, including releases of Docker images.


# Improve stability of Neuroconductor packages

One of the key metrics of package stability is code coverage, which we define as the proportion of the source code that is executed when running tests, examples, or vignettes (tutorials).  The `covr` package [@covr] has functions to report the coverage of a package, which can be reported using services such as CodeCov (https://codecov.io/) or Coveralls (https://coveralls.io/), which is implemented in Neuroconductor. 

With 4 releases (https://neuroconductor.org/releases/) in the past year (2019), the project has proved its ability to deliver checks and updates to a large number of packages.  The stability of those releases has grown over time, which is positive, but shows that improvements to the stability of the network of packages still need to be made.

John Muschelli will send a series of pull requests to packages that do not have code coverage over 50%.  These pull requests will try to increase the code coverage to necessary level, but moreso provide the groundwork for maintainers to create their own tests (especially those for edge cases).  Additionally, these pull requests will create vignettes of how to use the package if none exist.  These vignettes will have intentional errors and breaks so that developers must change these before submitting to Neuroconductor.  Documentation on increasing code coverage will be created to more formalize this process and help developers (see the next section).  

By the end of the funding year, all current packages must meet these requirements to stay within the Neuroconductor repository.


# Growing the contributor community

The Neuroconductor platform (https://neuroconductor.org/) [@neuroconductor] was started in 2014 at Johns Hopkins to centralize medical image analysis R packages, similar to the effort of Bioconductor [@bioconductor].  One of the main strengths of Neuroconductor is the developer community, which involves 26 maintainers residing in 5 countries, which contribute to, use, and advertise for Neuroconductor.   Our plan to strengthen the community is to host a conference call/meetup twice a year to discuss developments with the maintainers, including requesting feedback for ways to improve the platform, the submission process, feature requests, or increasing user/developer engagement.  With respect to users, we have had users in over 48 countries download packages from Neuroconductor.




Comparatively, the project development team is small and but also less diverse.  The team is currently all white males, 2 US-born and 2 Romanian-born.  Moreover, one of the developers (John Muschelli) contributes a total of 48 packages to the project.  Many of these packages (18) are data packages, which include image templates or example data sets for analysis, requiring little maintenance.  We would like to increase the number of developers, especially those from different countries, races, and sex.  Currently, out of the 26 maintainers, only 6 are female (23%).  

We propose to take the following steps to make it easier for new developers and users to contribute to the project.

## Developing a code coverage user guide

We have created documentation about what changes or checks are done to packages when submitting to Neuroconductor (https://neuroconductor.org/tutorials/continuous_integration) but no clear documentation of the expectations of the package.  

We propose to create:

1. Formal package guidelines that mirror closely, but not exactly, those from Bioconductor 
(https://www.bioconductor.org/developers/package-guidelines).
2. Examples of how to create unit tests and increase code coverage in Neuroconductor packages.
3. A contributor guide of how to create workflows and submit them to the tutorial area of Neuroconductor (https://neuroconductor.org/tutorials).

The last point is different than vignettes in a subtle way. As we require all vignettes in Neuroconductor to be built on Travis CI or Appveyor, the data must be accessible programmatically, enclosed in the package, or use data from other packages.  Package maintainers and developers may make full pipelines or example analyses that may be too computation-heavy for vignettes, interact with data sources that are not open, or use many packages that are not desirable dependencies for that package.  The tutorial area is for these analyses, but it is currently unclear how to create or submit these, thus we need a contributor guide.

## Adding new packages

There are a number of packages that exist in R for imaging, but are only hosted on GitHub or both GitHub/CRAN.  We reach out to these authors whenever we find those packages, but the effort is not always formalized.  Thus, we use R Documentation (https://www.rdocumentation.org/), which aggregates packages from all major R repositories to identify packages that are imaging-related and reach out to maintainers.  Along with the every-other-month call above, we believe these steps will increase the number (and hopefully the diversity) of developers and the number of contributions of developers.  We will count the number of package updates in our backend.

## Hands on tutorial

Either on site in Baltimore, at a remote site, or at an imaging conference, one in-person, hands-on tutorial will be given by John Muschelli.  This tutorial will be used to create an online course that will be either hosted on Leanpub or Coursera. 

# Refactor the Neuroconductor framework

## Portability of Neuroconductor 
Though most of the checking of packages is done on cloud-based continuous integration services, the backend is not in a true cloud platform, therefore not as portable as we would like.  Currently, the Neuroconductor backend is hosted on a RedHat 6.10 server at Johns Hopkins University with the backend consisting of Drupal 8 CMS framework that relies on PHP 5.3, MySQL 14.14 and Apache 2.4.  Over time, we have upgraded the backend to new operating systems, Drupal and PHP versions, and added additional third-party software to the server.  Though this has worked for our current needs, we wish to migrate the backend to a cloud-based server, likely Amazon Web Services (AWS).

<!-- The backend code is open, located at https://github.com/adigherman/neuroconductor.   -->

To address the portability of the system, we will create a custom AWS image that can be used to spool up a backend. This image will be versioned and backed up.  Thus, if we wish to create another centralized platform for R packages (such as for wearable devices), this should be possible without much work.

## Ease of Use of Neuroconductor

We will also create a series of Docker images that have a large percentage of the Neuroconductor packages installed, including open-source third party medical imaging software such as AFNI and ANTs [@afni; @avants2009advanced] and other-licensed software, such as FSL [@fsl].  These images will increase the ease of use for a number of users, especially those on Windows, as many imaging software packages may not work on Windows (though almost all R packages should). An example use case is providing these Docker images for students in our "Neurohacking in R" course (https://www.coursera.org/learn/neurohacking), which currently provides a downloadable virtual machine image for use. 

## Scaling Neuroconductor

Though Neuroconductor can handle the 98 packages, we wish to grow the community and number of packages.  Whenever a new package is submitted, that package must be checked, along with any packages that depend on that package.  That creates a large number of continuous integration (CI) jobs.  Thus, increasing the number of packages will require either a) more concurrent jobs on cloud systems, or b) the setup of servers for our needs.  Now, we believe the CI systems we employ can handle our needs, but we need to expand above the free, single-user plans, while keeping the dependency structure bookkeeping on our server side.  


# Work plan

The first objective is to improve stability of Neuroconductor packages. John Muschelli is best placed to do this as a developer of R packages for over 10 years and contributor to many Neuroconductor packages already.  

The second objective, to grow the contributor community, will be tackled by
John Muschelli, Brian Caffo, and Ciprian Crainiceanu. Ciprian and Brian are best placed to grow the community due to their large networks in the statistical and imaging communities.  Each has also organized meetings of many different parties, such as full conferences (ENAR - https://enar.org/). 

The third objective, to scale the Neuroconductor platform, will be handled by Adrian (Adi) Gherman.  As the main developer on the Neuroconductor backend, Adi is in a good position to implement the changes. He has experience with Drupal, PHP, and Docker, including carrying out large changes to the Neuroconductor system.


## Improve Stability 


The timescale is given on the assumption of John Muschelli working part
time on this goal (0.35 full time equivalent).  Our strategy to improve the stability of current packages is as follows:

1. For the 54 with insufficient code coverages, make pull requests to the packages (approximately 10 per month) - 6 months.  
2. Write tutorials for prospective contributors/developers on increasing code coverage and improved submissions - 2 months
3. Improve the existing user documentation on https://neuroconductor.org/ - 3 months

## Growing the contributor community

The timescale is given on the assumption of Ciprian Crainiceanu and Brian Caffo working part time on this goal (0.05 full time equivalent) and above time from John Muschelli.  

1. Set up a conference call once every 2 months - 1 month
2. Reach out to R-ladies Baltimore and other R-ladies group to discuss Neuroconductor to increase diversity in the user base - 2 months
3. Organize sessions related to Neuroconductor and open source software at imaging and statistics conferences - 1 month
4. Provide one hands-on tutorial - 3 months
4. Create a survey for developers to get more detailed information, such as identified sex, race, age, and other factors such as education attained and target analysis diseases - 2 months


## Refactor the Neuroconductor framework

The timescale is given on the assumption of Adrian Gherman working part
time on this goal (0.5 full time equivalent). 

1. Setting up AWS systems and testing - 1 month
2. Upgrading the Neuroconductor system to a newer OS version and most up-to-date Drupal/PHP/MySQL/Security - 2 months
3. Automating the creation of Docker images - 2 months
4. Implements new checks for code coverage and vignettes - 2 months

# Potential areas for growth
Though we wish to stabilize the Neuroconductor system, we wish to integrate analyses of imaging from Neuroconductor and "omics" from Bioconductor.  This integration is challenging due to the size of the data and heterogeneity of the sources, amongst many other reasons.  For a review, see @antonelli2019integrating. For example, the `limmi` package (https://github.com/muschellij2/limmi) is an attempt to coerce functional magnetic resonance imaging into a testing framework that both works with `limma` package [@limma] and into the `SummarizedExperiment` format, which both are fundamental elements from Bioconductor [@bioconductor].



# Existing support

We are currently applying for AWS credits in addition to the funding for computing here.  Neuroconductor has been supported by General Funds from the Biostatistics Department at Johns Hopkins Bloomberg School of Public Health.  NIH Grants XXX currently have a small amount of funding to support development of packages for the system, which have been used for package and backend development.

This Grant was generated with all materials at https://github.com/muschellij2/CZI and can be downloaded from https://johnmuschelli.com/CZI/index.pdf. 

References {#references .unnumbered}
==========
