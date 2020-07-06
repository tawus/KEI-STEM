## Word Lookup
#### An example to lookup words from a dictionary. 

In this example, we are using [Oxford Dictionary API](https://developer.oxforddictionaries.com) to lookup words.

### Usage

1. Clone this repository.
2. In the cloned folder, browse to the `word_lookup` directory and open word_lookup.rkt in your DrRacket IDE.
3. Create a file 'config.json' in this folder.
4. Paste the following contents into the file.

```
{
    "credentials": {
        "app-key": "placeholder_for_app_key",
        "app-id": "placeholder_for_app_id"
    }
}

```

3. Create an account with [Oxford Dictionary Website](https://developer.oxforddictionaries.com) and replace the placeholders for your application id and application key in `config.json` with your application id and application key.
5. Once your config.json is ready, click on the `Run` button
6. In the interactive area, write
	
```
	(display (describe (lookup-word "ingenious")))
```

### Improve when you are ready to!
You can improve this example in one of the ways :-
1. Write more tests. (You can look at the `word_lookup_test.rkt`)
2. Add core to look for any errors in the response and display appropriate message.
3. Write a better `describe` function!

