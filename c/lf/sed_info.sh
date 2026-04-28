
sed '/apple/!s/.*/orange/' file.txt

That would replace the entire line with "orange" if the line does not contain "apple". The ! after the address pattern inverts the match.

Another example: replacing all instances of "apple" in a line, but only if the line doesn't start with a certain pattern. Or maybe replacing characters that are not in a certain set. For example, replacing all lowercase letters except 'a' with an asterisk:

echo "abcde" | sed 's/[b-z]/*/g'

That would replace b, c, d, e with * but leave 'a' alone. Wait, but [b-z] includes from b to z, which would be bcdefghijklmnopqrsstuvwxyz. So the user might be confused if they wanted to exclude 'a', but the correct character class would be [^a].

So maybe they tried to use an exclamation mark or some operator incorrectly. Let me check.

In sed, the syntax for substitution is s/pattern/replacement/. The exclamation mark is used in address ranges or in shell commands as a special character, so perhaps the user was using the wrong symbol. If they meant to use negation in a regex, they should be using [^], not ! inside the regex itself.

So the key points are:

1. To match lines that do not contain a pattern: /pattern/!command
2. To match characters excluding a set: [^...]
3. Using ! after an address to invert the match.

They might also be trying to use a regex negation that's not supported in sed, like using ! in other regex engines, which isn't valid here. So emphasizing the correct syntax with the examples.

I should explain these points, give examples for each case, and clarify common pitfalls, maybe where the user might have confused the ! operator with [^].

Also, considering if they're using extended regular expressions (with -E option) versus basic, but the concepts of negation remain similar.

Another possible case: replacing everything except a specific pattern. For example, remove all characters except digits. Using s/[^0-9]//g. That might be another scenario where [^] is useful.

So, the user might have tried to write a regex in sed that didn't work because they used the wrong negation method. They probably have an example where they tried ! inside the regex which isn't valid. Clarifying that ! is for address negation, and [^] is for character class negation.

I should outline step by step examples for both scenarios: line negation and character class negation. Also mention that some advanced regex features from other tools (like Perl) aren't available in sed.
</think>

When working with `sed`, it's important to understand how to use regular expressions (regex) effectively, especially when you need to **negate conditions or exclude specific patterns**. Below is a breakdown of key concepts and examples to help clarify "sed regex not" scenarios.

---

### 1. **Negate Line Matching (`!` Operator)**
The `!` operator is used **after an address pattern** to **invert the match**. This is useful when you want to apply an action (like substitution) to **lines that do not contain a certain pattern**.

#### Example: Replace all lines **except** those containing "apple".
```bash
sed '/apple/!s/.*/ORANGE/' file.txt
```
- `/apple/` matches lines containing "apple".
- `!` inverts the match to **non-matching lines**.
- `s/.*/ORANGE/` replaces the entire line with "ORANGE".

---

### 2. **Negate Character Sets (`[^...]`)**
To **exclude specific characters** in a regex (like "not a digit"), use `[character-class]` with `^` inside brackets.

#### Example: Replace all **non-digits** with an underscore:
```bash
echo "abc123def" | sed 's/[^0-9]/_/g'
```
- `[^0-9]` matches any character that is **not a digit**.
- Result: `_123_`.

---

### 3. **Replace Everything Except a Pattern**
To **preserve only certain content** (e.g., only digits), delete or replace all unwanted characters.

#### Example: Extract only digits from a string:
```bash
echo "abc123def456" | sed 's/[^0-9]//g'
```
- `[^0-9]` removes all non-digit characters.
- Result: `123456`.

---

### 4. **Negate Substitutions for Specific Groups**
If you want to **exclude a pattern from substitution**, you can use **positive look-behind/look-ahead** (not natively supported in `sed`). As an alternative, use **capture groups**:

#### Example: Replace all `apple` occurrences except those in "applesauce".
```bash
echo "apple applesauce applepie" | sed 's/\bapple\b/FRUIT/g'
```
- `\b` ensures word boundaries (avoids matching "applesauce").
- Result: `FRUIT applesauce FRUITpie`.

---

### 5. **Common Pitfalls**
- **Confusing `!` within regex**: `!` is **not valid** inside character classes (`[^a]` is correct, `[!a]` is not).
- **Missing flags**: Use `-E` for **extended regex** (e.g., `\d`, `\w` are not supported in `sed`).
- **Greedy matching**: Use `\{...\}` for quantifiers in `sed` (e.g., `a\{3\}` for exactly 3 'a's).

---

### Summary Table

| Task                                | Command                                 | Description                              |
|-------------------------------------|------------------------------------------|-------------------------------------------|
| Replace non-"apple" lines           | `sed '/apple/!s/.*/REPLACEMENT/'`      | Replace lines not containing "apple"     |
| Remove non-digits                   | `sed 's/[^0-9]//g'`                       | Leave only digits in the input           |
| Replace all `apple` but not in "applesauce" | Use word boundaries (`\b`)        | Avoid partial matches with `\b`          |

---

By mastering `!` for address negation and `[^]` for character set negation, you can handle most "sed regex not" scenarios effectively. Let me know if you need help with a specific use case! 🍎✂️  
