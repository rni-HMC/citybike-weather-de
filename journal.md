# Jun 24 2024
The goal today is to get Airbyte working locally on my linux machine. Failed after spending two hours. abctl ran into a issue creating the kind cluster. The docker compose route ran into 502 bad gateway. I'll try on my Windows machine next.

# May 08 2024
Got started on the project today. Watched some youtube videos and decided to just jump right in. The stack is probably gonna look something like Airbyte > Dagster > some kind of data warehouse or deltalake > idk about BI tools. Took a minute setting up the Amazon EC2 instance - I wanted to try my hand at using terraform. Then I wanted to be able to set up and tear down infra on my Windows laptop, which required me to utilize devcontainers, since I prefer to handle everything in linux. 