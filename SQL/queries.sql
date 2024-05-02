'PART 1'

'Some fraudsters hack a credit card by making several small transactions (generally less than $2.00), which are typically ignored by cardholders.'


'Q1. How can you isolate (or group) the transactions of each cardholder?'

CREATE VIEW TRANSACTIONS_PER_CARDHOLDER AS
SELECT card_holder.name, credit_card.card, COUNT(*) FROM transaction
INNER JOIN credit_card ON transaction.card = credit_card.card
INNER JOIN card_holder ON credit_card.cardholder_id = card_holder.id
GROUP BY credit_card.card, card_holder.name
ORDER BY card_holder.name

'Q2. Count the transactions that are less than $2.00 per cardholder.'

CREATE VIEW LESS_THAN_TWO_TRANSACTIONS AS
SELECT card_holder.name, credit_card.card, COUNT(*) FROM transaction
INNER JOIN credit_card ON transaction.card = credit_card.card
INNER JOIN card_holder ON credit_card.cardholder_id = card_holder.id
WHERE transaction.amount < 2
GROUP BY credit_card.card, card_holder.name
ORDER BY card_holder.name


'Q3. Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.'

'A. It does not seem so. The most frequency of transactions less than 2 dollars was 13. Not a huge amount of money to be considered as hacked. One possibility that it may have been hacked would be if those small charged occurred within a very short period of time. For example, if that 13 transaction happened within a couple minutes, it would be suspicious. However, if that happened over a couple days or weeks, it would be normal.'




'Take your investigation a step further by considering the time period in which potentially fraudulent transactions are made'

'Q4. What are the top 100 highest transactions made between 7:00 am and 9:00 am?'

CREATE VIEW HIGHEST_TRANSACTIONS AS
SELECT card, merchant.name, merchant_category.name, amount FROM transaction
INNER JOIN merchant ON transaction.id_merchant = merchant.id
INNER JOIN merchant_category ON merchant.id_merchant_category = merchant_category.id
WHERE EXTRACT (HOUR FROM date) >= 7
AND EXTRACT (HOUR FROM date) < 9
ORDER BY amount DESC 
LIMIT 100

'Q5. Do you see any anomalous transactions that could be fraudulent?'

'Yes. Top purchases are made at restaurants, bars, and coffee shops. It does not seem normal for someone to spend over $1000 at a bar or restaurant or coffee shop. Escpecially if it happend around 7am - 9am. These seem anomalous and suspicious'

'Q6. Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?'

CREATE VIEW FRAUD_FREQUENCY_FOR_HIGH_AMOUNTS AS
SELECT EXTRACT (HOUR FROM date) AS HOUR, COUNT(*) AS NUM_OF_TRANSACTIONS 
FROM transaction
WHERE amount > 1500
GROUP BY EXTRACT (HOUR FROM date)
ORDER BY EXTRACT (HOUR FROM date)

CREATE VIEW FRAUD_FREQUENCY AS
SELECT EXTRACT (HOUR FROM date) AS HOUR, COUNT(*) AS NUM_OF_TRANSACTIONS 
FROM transaction
GROUP BY EXTRACT (HOUR FROM date)
ORDER BY EXTRACT (HOUR FROM date)

'The answer would depend on what kind of fraudulent we are talking about. If we are talking about oddly high amount of transactions, I filtered the data that only has amount higher than $1500.
This result showed that more fraudulent activities were seen around 2pm - 4pm. If we are talking about more frequent number of transactions as fraudulent activities, I cheked the number of transactions for every hour.
This result does not seem to have significant fraudulent activity. Every hour, there were consistently even number of transactions (around 130 - 160 transactions per hour). One might argue that people would not normally use their cards at late night or early morning
(maybe around 1am - 5am). Therefore, having almost the same number of transactions around those times compared to the rest of the day might be odd so possible fraudulent activities could be suspected around that time.'

'Q7. If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.'

'If I follow my first answer (2pm - 4pm), there might be more fraudulent transactions during this time because this is probably when people use their cards most often. 
It might be easy to sneak in fraudulent transactions within other normal transactions.
If I follow my second answer (1am - 5am), there might be more fraudulent transactions during this time because it would be easier time to use the card unnoticed by the card holders'

'Q8. What are the top 5 merchants prone to being hacked using small transactions?'

CREATE VIEW MERCHANTS_PRONE_TO_HACK AS
SELECT merchant.name, merchant_category.name, COUNT(amount) AS POSSIBLE_FRAUDULENT_COUNTS FROM transaction
INNER JOIN merchant ON transaction.id_merchant = merchant.id
INNER JOIN merchant_category ON merchant.id_merchant_category = merchant_category.id
WHERE amount < 3
GROUP BY merchant.id, merchant_category.id
ORDER BY COUNT(amount) DESC
LIMIT 5

'This answer would also depend on deciding how much is considered small transactions. I chose less than 3 dollars to be considered as small transactions.
Based on this, the top 5 merchants prone to being hacked are Rodriguez-Parker, Mcdaniel, Hines and Mcfarland, Santos-FItzgerald, Jarvis-Turner, and Patton-Rivera'