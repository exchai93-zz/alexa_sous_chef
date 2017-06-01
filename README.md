# Alexa Sous Chef

Welcome to **Alexa Sous Chef**, the ultimate virtual cooking assistant.

**Collaborators:** [@connie-reinholdsson](https://github.com/connie-reinholdsson), [@exchai](https://github.com/exchai93), [@emmpak](https://github.com/emmpak), [@eugeniaguerrero](https://github.com/eugeniaguerrero)

### Technologies used:
* Ruby (2.4.0)
* RSpec (3.6.0)
* Sinatra (2.0.0)
* FatSecret API (0.2.1)
* Amazon Developer
* Amazon Skills Kit (ASK)

### Testing
We used RSpec to test our code. This choice was influenced both by our familiarity with RSpec and by our desire to write fully test-driven code. So as to avoid exceeding the FatSecret API limit, we mocked our API calls.

### Real-world Application
A recent report by the Consumer Intelligence Research Partners (CIRP) estimated that there are now 8.2 million customers who own an Amazon Echo device, and as customer awareness is increasing RBC Capital Markets predict that Amazon could have 500 million active customers globally by 2020.

As four Makers who enjoy our fair share of cooking, we agreed that the growing number of online recipes and resultant use of electrical devices in the kitchen disrupted our cooking flow. Going back and forth to check the recipe instructions was disruptive to our overall cooking experience. Additionally, the fact that our recipes were no longer in traditional paperbound cookbooks but on our phones or tablets compounded the probability of accidentally splattering ingredients over our devices.

We decided to create the ultimate virtual cooking assistant using Amazon Echo to address this issue. Sous Chef offers over 1,000 recipes with voice-enabled instructions for a hands-free,  smoother and more enjoyable cooking experience.

### How it works
#### Structure of the skill
![Alt text](/images/Structure.png?raw=true "Structure of skill")

#### Response / request interaction
![Alt text](/images/Response.png?raw=true "Response of the skill")

### Future improvements
- Deploying the app to Heroku
- Saving favourite recipes

### User Stories

```
As a user,
So that I can start using Alexa Sous Chef,
I want Alexa to launch the skill upon my command.
```
```
As a user,
So that I can find a recipe to cook,
I want to search up to three ingredients.
```
```
As a user,
So that I can make a choice,
I want Alexa to list the top five available recipes.
```
```
As a user,
So that I can start cooking,
I want Alexa to confirm my choice and launch the recipe.
```
```
As a user,
So that I can check the ingredients of the recipe,
I want Alexa provide an option to read ingredients altogether or one at a time.
```
```
As a user,
So that I can continue with the recipe,
I want Alexa to list the preparation steps.
```
```
As a user,
So that I do not miss any information,
I want to ask Alexa to repeat any step.
```
```
As a user,
So that I can restart Sous Chef,
I want to ask Alexa to start over.
```
```
As a user,
So that I am guided through the cooking experience,
I want to ask Alexa for help.
```
## To use locally
#### Set this project up on the Amazon Developer console:
+ Create an Amazon Developer Account
+ [Create a new skill in the developer console](https://developer.amazon.com/alexa-skills-kit)

Configure the Interaction Model:
+ Fill in the Intent Schema
From the `intents.txt` file in the root folder.

+ Fill in the Custom Slot Type:
![Alt text](/images/custom_slots.png?raw=true "Skill slots")
Add the list ingredients to the INGREDIENT slot type from the `custom_slots.txt` file in the root folder.

+ Fill in the Sample Utterances:
From the `utterances.txt` file in the root of the folder.

#### To set up locally:
1. Clone this repository: ``git clone https://github.com/exchai93/alexa_sous_chef.git``
2. Run bundler: ``bundle install && bundle update``
3. [Install ngrok](https://ngrok.com/download)
4. Replace the ngrok file in the root of the project with the unzipped file you get after installing
5. [Create an account on FatSecret API](https://platform.fatsecret.com/api/Default.aspx?screen=r)
6. Create an .env file in the root of the project directory and set your FatSecret environment variables
  + ``FATSECRET_KEY='FATSECRET_KEY'``
  + ``FATSECRET_SECRET='FATSECRET_SECRET'``

#### To run:
5. Start rackup: ``rackup -p 4567``
6. Start ngrok: ``./ngrok http 4567``
7. Ask Alexa to open the Skill: `Alexa, open Sous Chef.`
