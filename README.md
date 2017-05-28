# Alexa Sous Chef

Welcome to **Alexa Sous Chef**, the ultimate cooking assistant.

**Collaborators:** [@connie-reinholdsson](https://github.com/connie-reinholdsson), [@exchai](https://github.com/exchai93), [@emmpak](https://github.com/emmpak), [@eugeniaguerrero](https://github.com/emmpak)

### Technologies used:
* Ruby (2.4.0)
* RSpec (3.6.0)

### Testing
We used RSpec to test. This choice was influenced both by our familiarity with RSpec and by our desire to write fully test-driven code. So as to avoid exceeding the FatSecret API limit, we mocked our API calls.

### Our approach

As four Makers who enjoy our fair share of cooking, we agreed that the growing number of online recipes and resultant use of electrical devices in the kitchen disrupted our cooking flow. Going back and forth to check the recipe instructions was disruptive to our overall cooking experience. Additionally, the fact that our recipes were no longer in traditional paperbound cookbooks but on our phones or tablets compounded the probability of accidentally splattering ingredients over our devices. From our research, we spotted a lack of Alexa skills available to help with this issue and thus set out to create a hands-free cooking experience.

### How it works
- Insert diagrams
- How the skill is structured (flow of intents)
- What happens when you interact with the skill

### Future improvements
- Deploying the app to Heroku

### User Stories

```As a user,
So that I can start using Alexa Sous Chef,
I want Alexa to launch the skill upon my command.

As a user,
So that I can choose a recipe,
I want Alexa to list the available recipes

As a user,
So that I can start cooking
I want Alexa to confirm my choice and launch the recipe.

As a user,
So that check I have the ingredients,
I want Alexa will list each ingredient and expect a yes / no response.

As a user,
So that I can start cooking,
I want Alexa to read out each step when I say 'next'.

As a user,
So that I do not miss any information,
I can ask Alexa to repeat the last sentence.

As a user,
So that I can time my cooking,
I want Alexa to have a time function.
```
## To use locally
#### Set this project up on the Amazon Developer console:
+ Create an Amazon Developer Account
+ [Create a new skill in the developer console](https://developer.amazon.com/alexa-skills-kit)

Configure the Interaction Model:
+ Fill in the Intent Schema
```{
  "intents": [
    {
      "slots": [
        {
          "name": "Recipe",
          "type": "RECIPE"
        }
      ],
      "intent": "FindRecipe"
    },
    {
      "slots": [
        {
          "name": "Action",
          "type": "ACTION"
        }
      ],
      "intent": "Steps"
    },
    {
      "slots": [
        {
          "name": "Read",
          "type": "READ"
        }
      ],
      "intent": "Ingredients"
    },
    {
      "intent": "AMAZON.RepeatIntent"
    },
    {
      "intent": "AMAZON.StartOverIntent"
    },
    {
      "intent": "AMAZON.StopIntent"
    },
    {
      "intent": "AMAZON.HelpIntent"
    },
    {
      "intent": "SearchRecipes",
      "slots": [
        {
          "name": "Ingredient",
          "type": "INGREDIENT"
        }
      ]
    }
  ]
}
```

Fill in the Sample Utterances
```FindRecipe pick {Recipe}
Steps {Action} the recipe
Steps {Action} step
Ingredients {Read}
SearchRecipes search {Ingredient}
```

#### To set up locally:
1. Clone this repository: ``git clone https://github.com/exchai93/alexa_sous_chef.git``
2. Run bundler: ``bundle install && bundle update``
3. [Install ngrok](https://ngrok.com/download)
4. Replace the ngrok file in the root of the project with the unzipped file you get after installing
5. [Create an account on FatSecret API](https://platform.fatsecret.com/api/Default.aspx?screen=r)
6. Create an .env file in the root of the project directory and set your FatSecret environment variables
  + ``FATSECRET_KEY='FATSECRET_KEY'``
  + ``FATSECRET_SECRET='FATSECRET_SECRET'``

### To run:
5. Start rackup: ``rackup -p 4567``
6. Start ngrok: ``./ngrok http 4567``
7. Ask Alexa to open the Skill: `Alexa, open Sous Chef.`
