package type;

/**
 * @author YellowAfterlife
 */
typedef GetSetOn<Ctx, T> = (obj:Ctx, ?isSet:Bool, ?setValue:T)->T;
