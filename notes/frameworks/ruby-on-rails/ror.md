<details>
  <summary>Answer</summary>
  <p>
  
  </p>
</details>

# Ruby


- What is an object?
- How would you declare and use a constructor in Ruby?
- How would you create getter and setter methods in Ruby?
- Describe the difference between class and instance variables?
- What are the three levels of method access control for classes and what do they signify?
- What does ‘self’ mean?
- Explain how (almost) everything is an object in Ruby.
- Explain what singleton methods are. What is Eigenclass in Ruby?
- Describe Ruby method lookup path.
- Describe available Ruby callbacks. How can we use them in practice?
- What is the difference between Proc and lambda?
- What is the difference between Ruby’s Hash and ActiveSupport’s HashWithIndifferentAccess?
<details>
  <summary>Answer</summary>
  Native Hash doesn't treat symbol key and string key as same. HashWithIndifferentAccess treats symbol and string keys as same.
</details>

- Given this input:

```ruby
x = [{"a" => 10},{"b" => 20},{"c" => 30}]
```

- How can you obtain the following?

```
- one array containing all keys
- another containing all values
- the sum of all the values
```

<details>
  <summary>Answer</summary>

  <p>
This works:

```ruby
y = x[0].merge(x[1]).merge(x[2])

y.keys                   # will return all keys
y.values                 # will return all values
y.values.inject(:+)      # will return the sum of all values
```

But a better first line would be this:

```ruby
y = x.reduce(:merge)
```

…because it would work on an array of any size, not just the exact input given.
  </p>
</details>

# Rack

What is Rack?
Explain the Rack application interface.
Write a simple Rack application.
How does Rack middleware works?

# RubyGems

What is RubyGems? How does it work?
How can you build your own Ruby gem?
Explain the structure of a Ruby gem.
Can you give me some examples of your favorite gems besides Ruby on Rails?

# 
What is ActiveJob? When should we use it?
What is Asset Pipeline?
Explain the difference between Page, Action, Fragment, Low-Level, SQL caching types.
What is a Rails engine?

# Rails MVC

Routing, Controllers, and Views
Provide an example of RESTful routing and controller.
Describe CRUD verbs and actions.
How should you test routes?
How should you use filters in controllers?
What are Strong Parameters?
What do we need to test in controllers?
How should you use content_for and yield?
How should you use nested layouts?

- What paths (HTTP verb and URL) will be defined by the following snippet in config/routes.rb?

```ruby
resources :posts do
  member do
    get 'comments'
  end
  collection do
    post 'bulk_upload'
  end
end
```

<details>
  <summary>Answer</summary>

  <p>
Using the resource method to define routes will automatically generate routes for the standard seven restful actions:

1. GET /posts
2. POST /posts
3. GET /posts/new
4. GET /posts/:id/edit
6. GET /posts/:id
7. PATCH/PUT /posts/:id
8. DELETE /posts/:id

Note that Rails also supports the (relatively) new URL verb PATCH for partial updates to records. (In theory, a PUT request should only be valid if the entire record is included in the request.)

The extra routes defined inside of the block passed to resources will generate one route valid for individual posts (GET /posts/:id/comments) as well as one defined for the top-level resource (POST /posts/bulk_upload).
  </p>
</details>

- Create a route to be able to display pages with different information about different types of beer. The route should recognize URL paths like /beer/<beer_type> and should use the same controller action for each type of beer with the actually beer type passed into the controller action as a parameter. The valid beer types are:

```
IPA
brown_ale
pilsner
lager
lambic
hefeweizen
Any other type of beer specified should generate a 404 status code.
```

<details>
  <summary>Answer</summary>

  <p>
One option would be to generate a simple get route that specifies the controller action to call and passes the kind of beer as a parameter:

```ruby
get 'beers/:kind' => 'beers#kind'
```

Then, within the context of the controller action, if the kind parameter is not included in the list of valid kinds, the action can raise a ActionController::RoutingError, which will redirect to 404 in production.

Alternatively, a simpler solution is to check against the list of valid kinds in the definition of the route. This can be accomplished using the constraints option as follows:

```ruby
kinds = %w|IPA brown_ale pilsner lager lambic hefweizen|
get 'beers/:kind' => 'beers#kind', constraints: {kind: Regexp.new(kinds.join('|'))}
```

This code calls the BeersController#kind action method with params['kind'] set to a string representing the beer type given in the URL path. The key is using the constraints option for the route to specify a regular expression to use to verify the route is correct. In this case, the lambda checks to see that the kind parameter is included in the list of valid beer types.

Or perhaps an even better solution would be to use resource routing. This has the added benefit of providing URL generation helpers, but at the cost of requiring that the parameter name for the beer be passed as :id. This would look something like:

```ruby
kinds = %w|IPA brown_ale pilsner lager lambic hefweizen|
resource :beer, only: [:show], constraints: {id: Regexp.new(kinds.join('|'))}
```

  </p>
</details>


# Active Record

- Explain the Active Record pattern.
- What is Object-Relational Mapping?
- Describe Active Record conventions.
- Explain the Migrations mechanism.
- Describe types of associations in Active Record.
- What is Scopes? How should you use it?
- Explain the difference between optimistic and pessimistic locking.
- Use ActiveSupport::Concern

<details>
  <summary>Answer</summary>

  <p>
If the code really belongs in the model (because it relies on ActiveRecord helpers), but there is a coherent grouping of methods, a concern might be worth implementing. For example, many models in a system could enable a user to create a note on a number of models:
  </p>

```ruby
require 'active_support/concern'

module Concerns::Noteable
  extend ActiveSupport::Concern

  included do
    has_many :notes, as: :noteable, dependent: :destroy
  end

  def has_simple_notes?
    notes.not_reminders_or_todos.any?
  end

  def has_to_do_notes?
    notes.to_dos.any?
  end

  def has_reminder_notes?
    notes.reminders.any?
  end
  ...
end
```
The Concern can then be applied like so:

```ruby
class Language < ActiveRecord::Base
  include TryFind
  include Concerns::Noteable
end
```

### Pros:
This is a great way of testing a cohesive piece of functionality and making it clear to other developers that these methods belong together. Unit tests can also operate on a test double or a stub, which will keep functionality as decoupled from the remaining model implementation as possible.

### Cons:
ActiveSupport::Concerns can be a bit controversial. When they are over-used, the model becomes peppered in multiple files and it’s possible for multiple concerns to have clashing implementations. A concern is still fundamentally coupled to Rails.

#### Ref:
See also:
- https://signalvnoise.com/posts/3372-put-chubby-models-on-a-diet-with-concerns
- http://api.rubyonrails.org/classes/ActiveSupport/Concern.html
- http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/

</details>

- What is wrong with the code below and how to fix it ?

```ruby
class CommentsController < ApplicationController
  def users_comments
    posts = Post.all
    comments = posts.map(&:comments).flatten
    @user_comments = comments.select do |comment|
      comment.author.username == params[:username]
    end
  end
end
```

<details>
  <summary>Answer</summary>

<p>
This is a classic example of the notorious “n+1” bug. The first line will retrieve all of the Post objects from the database, but then the very next line will make an additional request for each Post to retrieve the corresponding Comment objects. To make matters worse, this code is then making even more database requests in order to retrieve the Author of each Comment.

This can all be avoided by changing the first line in the method to:

```ruby
posts = Post.includes(comments: [:author]).all
```

This tells ActiveRecord to retrieve the corresponding Comment and Author records from the database immediately after the initial request for all Posts, thereby reducing the number of database requests to just three.

Please note that the above answer is only one of a few ways that it is possible to avoid incurring an “n+1” penalty, and each alternative will have its own caveats and corner cases. The above answer was selected to be presented here since it requires the smallest change to the existing code and makes no assumptions regarding the reverse association of Comment to Post.

Incidentally, there’s another issue here (although not what we’re focused on in this question and answer); namely, erforming a query in Ruby that could instead be done in the database (and which would very likely be faster there!). A relatively complex query like this can instead be constructed in ActiveRecord pretty easily, thus turning a 3 database query operation (plus some Ruby code executing) into a single database query.  
</p>

</details>

- How would you define a Person model so that any Person can be assigned as the parent of another Person (as demonstrated in the Rails console below)? What columns would you need to define in the migration creating the table for Person?


```ruby
irb(main):001:0> john = Person.create(name: "John")
irb(main):002:0> jim = Person.create(name: "Jim", parent: john)
irb(main):003:0> bob = Person.create(name: "Bob", parent: john)
irb(main):004:0> john.children.map(&:name)
=> ["Jim", "Bob"]

# And for a more advanced challenge: Update the Person model so that you can also get a list of all of a person’s grandchildren, as illustrated below. Would you need to make any changes to the corresponding table in the database?

irb(main):001:0> sally = Person.create(name: "Sally")
irb(main):002:0> sue = Person.create(name: "Sue", parent: sally)
irb(main):003:0> kate = Person.create(name: "Kate", parent: sally)
irb(main):004:0> lisa = Person.create(name: "Lisa", parent: sue)
irb(main):005:0> robin = Person.create(name: "Robin", parent: kate)
irb(main):006:0> donna = Person.create(name: "Donna", parent: kate)
irb(main):007:0> sally.grandchildren.map(&:name)
=> ["Lisa", "Robin", "Donna"]
```

<details>
  <summary>Answer</summary>

  <p>

    Normally, the target class of an ActiveRecord association is inferred from the association’s name (a perfect example of “convention over configuration”). It is possible to override this default behavior, though, and specify a different target class. Doing so, it is even possible to have relationships between two objects of the same class.

This is how it is possible to set up a parent-child relationship. The model definition would look like:

```ruby
class Person < ActiveRecord::Base
  belongs_to :parent, class: Person
  has_many :children, class: Person, foreign_key: :parent_id
end
```

It’s necessary to specify the foreign_key option for the has_many relationship because ActiveRecord will attempt to use :person_id by default. In the migration to create the table for this model, you would need to define, at minimum, a column for the name attribute as well as an integer column for parent_id.

Self-referential relationships can be extended in all the same ways as normal two-model relationships. This even includes has_many ... :through => ... style relationships. However, because we are circumventing Rails’ conventions, we will need to specify the source of the :through in the case of adding a grandchild relationship:

```ruby
class Person < ActiveRecord::Base
  belongs_to :parent, class: Person
  has_many :children, class: Person, foreign_key: :parent_id
  has_many :grandchildren, class: Person, through: :children, source: :children
end
```

Consequently, since this is still just using the parent_id defined in the first case, no changes to the table in the database are required.

  </p>
</details>

- Suppose we have a Student with id=”4”. If we delete the Student with id=”4”, what will be the result of the following queries:

```ruby
Student.find(4)
Student.find_by_id(4)
```

<details>
  <summary>Answer</summary>

  <p>
- Student.find(4) will raise an error: ActiveRecord::RecordNotFound: Couldn't find Student with id=4
- Student.find_by_id(4) will return nil and will not raise an error.
  </p>
</details>

- Delegates

<details>
  <summary>Answer</summary>

  <p>

Depending on the source of the bloat, sometimes it makes better sense to delegate to a service class. 10 lines of validation code can be wrapped up in a custom validator and tucked away in app/validators. Transformation of form parameters can be placed in a custom form under app/forms. If you have custom business logic, it may be prudent to keep it in a lib/ folder until it’s well defined.

The beauty of delegation is that the service classes will have no knowledge of the business domain and can be safely refactored and tested without any knowledge of the models.

### Pros:

This approach is elegant and builds a custom library on top of what Ruby on Rails provides out of the box.

### Cons:

If the underlying APIs change, your code will likely need to be updated to match. Instead of coupling to your model layer, you’ve now coupled yourself to either Ruby on Rails or a third-party library.

### See also:

- http://guides.rubyonrails.org/active_record_validations.html#custom-validators
- https://github.com/apotonick/reform
- https://robots.thoughtbot.com/activemodel-form-objects
- https://github.com/timcraft/formeze

### Conclusion :
This question helps demonstrate two critical skills every Ruby developer needs to develop: how handle complexity from emerging requirements and how to decide the most appropriate refactoring.

By working through different refactoring strategies, I can explore a candidate’s problem solving skills and their overall familiarity with Ruby on Rails and their knowledge of MVC. It’s important to know what is code that is specific to the application and what can be generalized into a completely decoupled piece of functionality.
  </p>
</details>

# Security

- What is CSRF and how to protect against it ?

<details>
  <summary>Answer</summary>
  
  <p>
CSRF stands for Cross-Site Request Forgery. This is a form of an attack where the attacker submits a form on your behalf to a different website, potentially causing damage or revealing sensitive information. Since browsers will automatically include cookies for a domain on a request, if you were recently logged in to the target site, the attacker’s request will appear to come from you as a logged-in user (as your session cookie will be sent with the POST request).

In order to protect against CSRF attacks, you can add protect_from_forgery to your ApplicationController. This will then cause Rails to require a CSRF token to be present before accepting any POST, PUT, or DELETE requests. The CSRF token is included as a hidden field in every form created using Rails’ form builders. It is also included as a header in GET requests so that other, non-form-based mechanisms for sending a POST can use it as well. Attackers are prevented from stealing the CSRF token by browsers’ “same origin” policy.
 </p>
</details>

- Explain what is a sessions mechanism. How does it work?
- Describe cross-site request forgery, cross-site scripting, session hijacking, and session fixation attacks.
- What is the difference between SQL Injection and CSS Injection?
- How should you store secure data such as a password?
- Why do we need to use HTTPS instead of HTTP?


Testing
What is unit testing (in classical terms)?
What is the primary technique for writing a test?
What are your favorite tools for writing unit tests?
What are your favorite tools for writing feature tests?

Refactoring
What is a code smell?
What are your favorite tools to find code smells and potential bugs?
Why should you avoid fat controllers?
Why should you avoid fat models?
Explain extract Value, Service, Form, View, Query, and Policy Objects techniques.


Task Definition
I'm passionate about productivity. I want to manage my tasks and projects more effectively. I need a simple tool that helps me control my task flow.

Functional Requirements:
I want to be able to sign in/sign up by email/password or Facebook;
I want to be able to create/update/delete projects;
I want to be able to add tasks to my project;
I want to be able to update/delete tasks;
I want to be able to prioritise tasks within a project;
I want to be able to set a deadline for my task;
I want to be able to mark a task as 'done';
I want to be able to add comments to my tasks;
I want to be able to delete comments;
I want to be able to attach files to comments.
Technical Requirements
It should be a WEB application:
For the client side, use HTML5, CSS3, Bootstrap, JavaScript, AngularJS, and jQuery;
For the server side, use Ruby on Rails.
It should have client side and server side validation;
It should work like a single-page WEB application and should use AJAX technology (load and submit data without reloading a page);
It should have a user authentication solution. The user should only have access to his/her own projects and tasks (Devise, Cancancan);
It should have automated tests for all functionality (models - RSpec, controllers - RSpec, acceptance/functional tests - RSpec + Capybara);
The result should be similar to the one in the screenshot below:

![Take home task](./rails-take-home-task.jpg)

Source : https://rubygarage.org/blog/how-to-interview-your-ruby-on-rails-developer