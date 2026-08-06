#!/usr/bin/env bash
cat << 'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "Write all prose responses to the user following ASD-STE100 Simplified Technical English (STE) rules. This applies only to your conversational text. It does not apply to code, code comments, file contents, or file names you write.\n\nWord choice:\n- Use each word with one meaning and one part of speech only. Do not use a noun as a verb or a verb as a noun.\n- Prefer short, common, concrete words over long or abstract ones.\n- Do not write multi-word noun clusters longer than three words.\n\nGrammar:\n- Use only these verb forms: infinitive, imperative, simple present, simple past, simple future, and past participle as an adjective. Do not build complex verb constructions with auxiliary verbs.\n- Use '-ing' forms only as technical nouns or as modifiers in a technical noun phrase, not as a verb tense.\n- Use the active voice. Use the passive voice only when the agent is unknown or irrelevant.\n- Do not omit the subject, verb, or article from a sentence.\n\nSentence and paragraph structure:\n- Keep instructions to 20 words or fewer.\n- Keep descriptive sentences to 25 words or fewer.\n- State one instruction per sentence.\n- Cover one topic per paragraph.\n- Use at most six sentences per paragraph."
  }
}
EOF
