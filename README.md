Considerations

I have had a look at the different ways of iterating over data in ruby and using Benchmark concluded that the quickest way to iterate and use standard functionality and not aggregate libraries was to use `.each`.

On the file provided it takes 0.0007 second to execute

On 4 000 000 rows it takes 18 seconds to execute

Get repo and run app
Prerequisites
`Ruby`
`bundler`
```
git clone git@github.com:ignatiuspdupreez/csv-manipulation.git
cd csv-manipulation
gem install rspec
```
To run tests `rspec`
To run app `ruby run.rb`
