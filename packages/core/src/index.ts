export enum ChannelType {
  WEB = 'WEB',
  WHATSAPP = 'WHATSAPP',
  INSTAGRAM = 'INSTAGRAM',
}

export type ClassificationResult = {
  categoryKey: string;
  serviceKey: string;
  confidence: number;
  matchedKeywords: string[];
};

type TaxonomyEntry = {
  categoryKey: string;
  serviceKey: string;
  keywords: readonly string[];
};

const TAXONOMY: readonly TaxonomyEntry[] = [
  { categoryKey: 'computers', serviceKey: 'computer-repair', keywords: ['компьютер', 'ноутбук', 'windows', 'виндовс', 'моноблок', 'роутер'] },
  { categoryKey: 'appliances', serviceKey: 'appliance-repair', keywords: ['стиральн', 'холодильник', 'микроволнов', 'пылесос', 'посудомоеч', 'бытов'] },
  { categoryKey: 'handyman', serviceKey: 'handyman', keywords: ['мастер на час', 'повесить', 'собрать мебель', 'полка', 'карниз', 'смеситель'] },
  { categoryKey: 'renovation', serviceKey: 'home-renovation', keywords: ['ремонт квартир', 'ремонт комнаты', 'штукатур', 'плитк', 'обои', 'ламинат', 'покрас'] },
  { categoryKey: 'moving', serviceKey: 'cargo-moving', keywords: ['грузоперевоз', 'переезд', 'газель', 'грузчик', 'перевезти мебель'] },
  { categoryKey: 'courier', serviceKey: 'courier', keywords: ['курьер', 'доставить', 'доставка документов', 'забрать посыл'] },
  { categoryKey: 'cleaning', serviceKey: 'cleaning', keywords: ['уборк', 'клининг', 'помыть окна', 'генеральная уборка'] },
  { categoryKey: 'photo', serviceKey: 'photo-design', keywords: ['фотограф', 'фотосесс', 'оформление', 'дизайн баннер'] },
  { categoryKey: 'errands', serviceKey: 'errands', keywords: ['поручение', 'забрать', 'отнести', 'купить и привезти'] },
  { categoryKey: 'auto', serviceKey: 'mobile-auto-service', keywords: ['авто', 'машин', 'аккумулятор', 'прикурить', 'шиномонтаж', 'автосервис'] },
  { categoryKey: 'beauty', serviceKey: 'mobile-beauty', keywords: ['макияж', 'маникюр', 'прическ', 'парикмахер', 'косметолог'] },
];

export function classifyRequestText(input: string): ClassificationResult {
  const text = input.toLocaleLowerCase('ru-RU');
  let best: TaxonomyEntry = TAXONOMY[0];
  let matches: string[] = [];

  for (const entry of TAXONOMY) {
    const current = entry.keywords.filter((keyword) => text.includes(keyword));
    if (current.length > matches.length) {
      best = entry;
      matches = current;
    }
  }

  if (matches.length === 0) {
    return {
      categoryKey: 'general',
      serviceKey: 'general-service',
      confidence: 0.25,
      matchedKeywords: [],
    };
  }

  return {
    categoryKey: best.categoryKey,
    serviceKey: best.serviceKey,
    confidence: Math.min(0.95, 0.55 + matches.length * 0.12),
    matchedKeywords: matches,
  };
}

export function providerMatchScore(reliabilityScore: number, responseSpeedScore: number): number {
  const reliability = Math.max(0, Math.min(1, reliabilityScore));
  const speed = Math.max(0, Math.min(1, responseSpeedScore));
  return Number((reliability * 0.55 + speed * 0.45).toFixed(4));
}

export const DISTRIBUTION_WAVE_SIZES = [5, 10, 20] as const;
export const DISTRIBUTION_WAVE_DELAYS_MS = [90_000, 180_000] as const;
