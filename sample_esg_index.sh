curl -XPUT http://localhost:9200/sample_esg?pretty -H 'Content-Type: application/json' -d '
{
  "settings": {
    "analysis": {
      "analyzer": {
        "test_kuromoji_analyzer": {
          "type": "custom",
          "tokenizer": "kuromoji_tokenizer"
        }
      }
    }
  }
}'

curl -XPUT http://localhost:9200/sample_esg/_mapping?pretty -H 'Content-Type: application/json' -d '
{
  "properties": {
    "document_id": { "type": "keyword" },
    "document_name": { "type": "keyword" },
    "company_id": { "type": "long" },
    "fiscal_year": { "type": "long" },
    "text": { "type": "text" }
  }
}'

curl -XGET http://localhost:9200/sample_esg/_mapping?pretty


curl -XPOST http://localhost:9200/sample_esg/_doc?pretty -H 'Content-Type: application/json' -d '
{
  "document_id": 1,
  "document_name": "環境ビジョン・方針",
  "company_id": 1,
  "fiscal_year": 2017,
  "text": "当社は、事業に関わるあらゆる活動の中で、環境保全に資するサービスの提供等に積極的に取り組むことで、デジタル技術を駆使して地球環境問題への貢献を目指します。"
}'

curl -XPOST http://localhost:9200/sample_esg/_doc?pretty -H 'Content-Type: application/json' -d '
{
  "document_id": 2,
  "document_name": "環境ビジョン・方針",
  "company_id": 1,
  "fiscal_year": 2017,
  "text": "当社の全役職員は、良き社会のメンバーとして、バリューチェーンを通じた汚染の予防、地球環境負荷の低減に貢献するよう努めます。地球環境に負荷を与える企業活動については、その認識に基づき、一人一人が責任を分かち合い、努力を積み重ね、環境保護に向けた活動を推進します。"
}'

curl -XPOST http://localhost:9200/sample_esg/_doc?pretty -H 'Content-Type: application/json' -d '
{
  "document_id": 3,
  "document_name": "環境ビジョン・方針",
  "company_id": 1,
  "fiscal_year": 2018,
  "text": "環境への国際的な関心の高まりを背景に、グループ全体基本方針および国内外の関連施策などから環境推進の流れに沿った方向性を決定し、企業活動・サービス提供の両面から中長期的な目標設定と目標達成に向けた取り組みを推進します。"
}'

curl -XPOST http://localhost:9200/sample_esg/_doc?pretty -H 'Content-Type: application/json' -d '
{
  "document_id": 4,
  "document_name": "地球温暖化防止等に向けた取り組み",
  "company_id": 2,
  "fiscal_year": 2018,
  "text": "当社では、エネルギー使用にかかる原単位の前年度比1%削減に取り組んでいます。"
}'

curl -XPOST http://localhost:9200/sample_esg/_doc?pretty -H 'Content-Type: application/json' -d '
{
  "document_id": 5,
  "document_name": "地球温暖化防止等に向けた取り組み",
  "company_id": 2,
  "fiscal_year": 2018,
  "text": "会議スペースへのモニター設置など、使用量削減に努めています。"
}'
