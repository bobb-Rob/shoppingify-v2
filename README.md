<a name="readme-top"></a>
<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
    - [Functionalities](#Functionalities)
  - [🚀 Live Demo](#live-demo)
  - [🚀 Frontend Repository](#frontend-repository)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Shoppingify <a name="about-project"></a>


**Shoppingify** uses a rails API only to create endpoints that serves this fullstack web application that will help users keep track of their shopping activities.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>


- _**Analysis**_ showing where most of your spending goes
- Track your shopping _**history**_ by noticing recurrent trends

### Functionalities <a name="Functionalities"></a>


- When I select the items tab, I can see a list of items under different categories.
- I can add a new item with name, category, note, and image.
- When I add a new item, I can select one from the existing categories or add a new one if the category does not exist 🔥
- When I select an item, I can see its details and I can choose to add the current list or delete the item.
- I can add items to the current list 😋
- I can increase the number of item in the list
- I can remove the item from the list
- I can save/update the list with a name (user can have only one active list at a time)
- I can toggle between editing state and completing state
- When I am at completing state, I can save my progress by selecting the item
- I can cancel the active list 😄
- When I try to cancel a list, I can see a confirmation notification
- I can see my shopping history and I can see the details of it
- I can see some statistics: top items, top categories, and monthly comparison.
- I can search for items

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Base url](https://shoppingify-ten.vercel.app/)
- [Live Demo of Frontend](https://shoppingify-ten.vercel.app/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Frontend Repository <a name="frontend-repository"></a>

- [Frontend Repository](https://github.com/bobb-Rob/shoppingify)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### **Prerequisites**

In order to run this project you need have folowwing installed on your machine:

    - Node.js
    - Ruby:latest
    - Ruby on Rails 7+
    - Bundle installer (`gem install bundler`)

### **Setup**

Clone this repository to your desired folder:


```sh
  cd my-folder
  git clone https://github.com/bobb-Rob/shoppingify-v2.git
```

### **Install**

_Install this project with:_

```sh
  cd my-project
  bundle install
```

### **Usage**

To run the project, execute the following commands:

```sh
  bin/rails db:create

  bin/rails db:migrate

  bin/rails server
```
-

### Run tests

To run tests, run the following command:
```sh
  bin/rails spec
```

<!--
Example command:

```sh
  bin/rails test test/models/article_test.rb
```
--->

### Deployment

You can deploy this project using:


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>



| 👤 Name | Github | Twitter | LinkedIn |
|------|--------|---------|----------|
|Robertson Akpan|[@bobb-rob](https://github.com/bobb-rob)|[@___Robertson](https://twitter.com/___Robertson)|[@RobertsonAkpan](https://www.linkedin.com/in/robertsonakpan/)|


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 **Future Features** <a name="future-features"></a>

- Sync your phone message with in-app budget tool to help tract spending and overtime help restrain unecessary spending
- Add another user as co-planner and event purchase helper
- Attach summary note to completed list or canceled list

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, and would love to see how we monetize this kind of app, you can reach out to me.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank [DevChallenges](https://devchallenges.io/) for this inspiring project design.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.
